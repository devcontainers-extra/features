#!/usr/bin/env bash

set -e

source ./library_scripts.sh

VALKEY_VERSION="${VERSION:-"latest"}"

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# valkey does not publish prebuilt binaries, only source tarballs, so we build
# from source, following the official valkey-container Dockerfile:
# https://github.com/valkey-io/valkey-container/blob/mainline/Dockerfile.template

# make sure we have curl and jq for resolving the latest version
if ! type curl >/dev/null 2>&1 || ! type jq >/dev/null 2>&1; then
    if [ -x "/usr/bin/apt-get" ]; then
        $nanolayer_location install apt-get "curl jq"
    elif [ -x "/sbin/apk" ]; then
        apk add --no-cache curl jq
    else
        echo "distro not supported"
        exit 1
    fi
fi

# resolve "latest" to the newest stable release tag
if [[ "$VALKEY_VERSION" == "latest" ]]; then
    VALKEY_VERSION="$(curl -sfL https://api.github.com/repos/valkey-io/valkey/releases/latest | jq -r '.tag_name')"
fi

# download the source tarball (clean_download minimizes layer leftovers)
TARBALL_URL="https://github.com/valkey-io/valkey/archive/refs/tags/${VALKEY_VERSION}.tar.gz"
clean_download "$TARBALL_URL" /tmp/valkey.tar.gz

# verify the tarball against the official valkey-hashes file (same as valkey-container)
# format: hash <filename> <algo> <digest> <url>  (the last match wins, in case of re-releases)
HASHES_URL="https://raw.githubusercontent.com/valkey-io/valkey-hashes/main/README"
EXPECTED_SHA="$(curl -sfL "$HASHES_URL" | awk -v f="valkey-${VALKEY_VERSION}.tar.gz" '$2 == f { sha = $4 } END { print sha }')"
if [[ -n "$EXPECTED_SHA" ]]; then
    echo "$EXPECTED_SHA  /tmp/valkey.tar.gz" | sha256sum -c -
else
    echo "warning: no sha256 found in valkey-hashes for $VALKEY_VERSION, skipping verification"
fi

# install build dependencies (mirrors the valkey-container build stage; systemd is
# skipped since dev containers do not run systemd)
if [ -x "/usr/bin/apt-get" ]; then
    $nanolayer_location install apt-get "dpkg-dev gcc libc6-dev libssl-dev make"
elif [ -x "/sbin/apk" ]; then
    apk add --no-cache build-base linux-headers openssl-dev
else
    echo "distro not supported"
    exit 1
fi

# extract and build with TLS support
mkdir -p /usr/src/valkey
tar -xzf /tmp/valkey.tar.gz -C /usr/src/valkey --strip-components=1
rm /tmp/valkey.tar.gz

export BUILD_TLS=yes
make -C /usr/src/valkey -j "$(nproc)" all
make -C /usr/src/valkey install

# cleanup the build tree
rm -rf /usr/src/valkey

echo 'Done!'