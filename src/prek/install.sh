#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# Detect C library type (musl for Alpine, gnu for Debian/Ubuntu)
if [ -f "/lib/ld-musl-x86_64.so.1" ] || [ -f "/lib/ld-musl-aarch64.so.1" ]; then
    clib_type=musl
else
    clib_type=gnu
fi

# Detect architecture
architecture="$(uname -m)"
case $architecture in
    x86_64)
        arch="x86_64"
        ;;
    aarch64)
        arch="aarch64"
        ;;
    *)
        echo "(!) Architecture ${architecture} is not supported"
        exit 1
        ;;
esac

# Build asset regex to match prek release binaries
# Example: prek-x86_64-unknown-linux-gnu.tar.gz
asset_regex="^prek-${arch}-unknown-linux-${clib_type}\\.tar\\.gz$"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/gh-release:1.0.26" \
    --option repo='j178/prek' \
    --option binaryNames='prek' \
    --option version="$VERSION" \
    --option assetRegex="$asset_regex"

echo 'Done!'
