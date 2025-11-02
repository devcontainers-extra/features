#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# uv uses uv-`uname -m`-unknown-linux-gnu.tar.gz naming,
# the default "arm64" filter for aarch64 would match a 32 bit arm binary instead
arch_segment=""
case "$(uname -m)" in
    x86_64)
        arch_segment="x86_64"
        ;;
    aarch64|arm64)
        arch_segment="aarch64"
        ;;
    *)
        arch_segment="$(uname -m)"
        ;;
esac
asset_regex="^uv-${arch_segment}-unknown-linux-gnu\\.tar\\.gz$"

# Example nanolayer installation via devcontainer-feature
$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/gh-release:1" \
    --option repo='astral-sh/uv' \
    --option binaryNames='uv,uvx' \
    --option assetRegex="$asset_regex" \
    --option version="$VERSION" \
    --option libName='uv'

echo 'Done!'
