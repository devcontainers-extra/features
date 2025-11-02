#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# Detect C library type
if [ -f "/lib/ld-musl-x86_64.so.1" ] || [ -f "/lib/ld-musl-aarch64.so.1" ]; then
    clib_type=musl
else
    clib_type=gnu
fi

# Detect architecture
architecture="$(uname -m)"
case $architecture in
    arm64)
        arch="aarch64"
        ;;
    armv7)
        clib_type="${clib_type}eabihf"
        ;;
    *)
        arch="$architecture"
        ;;
esac
asset_regex="^bottom_${arch}-unknown-linux-${clib_type}\\.tar\\.gz$"

# Exclude nightly prereleases, only match semantic version tags
release_tag_regex="^(?!.*nightly)[0-9]+\\.[0-9]+\\.[0-9]+$"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/gh-release:1" \
    --option repo='ClementTsang/bottom' --option binaryNames='btm' --option version="$VERSION" --option assetRegex="$asset_regex" --option releaseTagRegex="$release_tag_regex"



echo 'Done!'

