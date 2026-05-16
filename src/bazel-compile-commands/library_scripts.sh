#!/usr/bin/env bash

# Adapted from https://github.com/devcontainers-community/features-bazel/blob/main/lib.sh
# which itself traces back to the official devcontainers/features node install script.

# Runs apt-get update only when the apt lists cache is empty, avoiding redundant network hits.
apt_get_update() {
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Installs the given packages only if they are not already installed (checked via dpkg).
# Debian/Ubuntu only; calls apt_get_update lazily rather than unconditionally.
check_packages() {
    if ! dpkg -s "$@" > /dev/null 2>&1; then
        apt_get_update
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Removes apt list files to keep the container layer small.
apt_cleanup() {
    rm -rf /var/lib/apt/lists/*
}

# Ensures the given packages are installed, using apt-get on Debian/Ubuntu or apk on Alpine.
ensure_packages() {
    if command -v apt-get >/dev/null 2>&1; then
        check_packages "$@"
    elif command -v apk >/dev/null 2>&1; then
        apk add --no-cache "$@"
    else
        echo "No supported package manager found to install: $*" >&2
        exit 1
    fi
}

detect_platform() {
    local os
    os="$(uname -s)"
    case "${os}" in
        Linux)  echo "linux" ;;
        Darwin) echo "macos" ;;
        *)      echo "Unsupported platform: ${os}" >&2; exit 1 ;;
    esac
}

detect_arch() {
    local arch
    arch="$(uname -m)"
    case "${arch}" in
        x86_64)          echo "amd64" ;;
        aarch64 | arm64) echo "arm64" ;;
        *)               echo "Unsupported architecture: ${arch}" >&2; exit 1 ;;
    esac
}

# Resolves a user-provided version string to the exact GitHub release tag.
# Accepted inputs: "latest", "0.22.4", "v0.22.4", or "bazel-compile-commands-v0.22.4"
resolve_tag() {
    local version="$1"
    local repo="$2"
    local tag_prefix="$3"   # e.g. "bazel-compile-commands"

    if [ "${version}" = "latest" ]; then
        curl -fsSL "https://api.github.com/repos/${repo}/releases/latest" \
            | grep '"tag_name"' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/'
    elif [[ "${version}" == ${tag_prefix}-* ]]; then
        echo "${version}"
    elif [[ "${version}" == v* ]]; then
        echo "${tag_prefix}-${version}"
    else
        echo "${tag_prefix}-v${version}"
    fi
}

# Downloads a GitHub release zip asset, extracts a named binary, and places it in /usr/local/bin.
#
# Usage: install_via_zip <zip_url> <binary_name>
#
#   zip_url     - Direct URL to the .zip asset on GitHub Releases.
#   binary_name - Name of the binary inside the archive (e.g. "bazel-compile-commands").
#
# unzip is auto-installed if not already present, and the temporary download
# directory is cleaned up on exit.
install_via_zip() {
    local zip_url="$1"
    local binary_name="$2"

    ensure_packages unzip

    local tmp_dir
    tmp_dir=$(mktemp -d)
    curl -fsSL "${zip_url}" -o "${tmp_dir}/${binary_name}.zip"
    unzip -j "${tmp_dir}/${binary_name}.zip" -d "${tmp_dir}"
    install -m 0755 "${tmp_dir}/${binary_name}" /usr/local/bin/
    rm -rf "${tmp_dir}"
}
