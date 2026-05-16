#!/usr/bin/env bash

set -e

source ./library_scripts.sh

BINARY_NAME="bazel-compile-commands"
GITHUB_REPO="kiron1/bazel-compile-commands"
VERSION="${VERSION:-"latest"}"

PLATFORM="$(detect_platform)"
ARCH="$(detect_arch)"
ensure_packages curl ca-certificates
TAG="$(resolve_tag "${VERSION}" "${GITHUB_REPO}" "${BINARY_NAME}")"

# Extract the numeric version from the tag (e.g. "bazel-compile-commands-v0.22.4" → "0.22.4")
FILE_VERSION="${TAG#${BINARY_NAME}-v}"

BASE_URL="https://github.com/${GITHUB_REPO}/releases/download/${TAG}"

echo "Installing ${BINARY_NAME} ${TAG} for ${PLATFORM}/${ARCH}..."

USE_DEB=false
ZIP_ASSET=""

if [ "${PLATFORM}" = "linux" ]; then
    # On Ubuntu Noble (24.04), prefer the native .deb package; fall back to the generic .zip.
    if command -v apt-get >/dev/null 2>&1 && \
       [ -f /etc/os-release ] && \
       grep -qi "noble" /etc/os-release; then
        USE_DEB=true
    else
        ZIP_ASSET="linux_${ARCH}"
    fi
elif [ "${PLATFORM}" = "macos" ]; then
    ZIP_ASSET="macos_universal"
fi

if [ "${USE_DEB}" = true ]; then
    echo "Ubuntu Noble detected – installing via .deb package..."
    TMP_DEB=$(mktemp --suffix=.deb)
    curl -fsSL "${BASE_URL}/${BINARY_NAME}_${FILE_VERSION}-noble_${ARCH}.deb" -o "${TMP_DEB}"
    apt_get_update
    apt-get install -y "${TMP_DEB}"
    rm -f "${TMP_DEB}"
    apt_cleanup
else
    echo "Installing via .zip (${ZIP_ASSET})..."
    install_via_zip "${BASE_URL}/${BINARY_NAME}_${FILE_VERSION}-${ZIP_ASSET}.zip" "${BINARY_NAME}"
fi

echo "Done! ${BINARY_NAME} installed to /usr/local/bin/${BINARY_NAME}"
