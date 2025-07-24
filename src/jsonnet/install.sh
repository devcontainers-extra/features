#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# Jsonnet installation
$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/gh-release:1" \
    --option repo='google/go-jsonnet' \
    --option binaryNames='jsonnet,jsonnet-deps,jsonnetfmt,jsonnet-lint' \
    --option libName='jsonnet' \
    --option version="$VERSION"

# jsonnet-bundler installation (optional)
if [ "${INSTALLJSONNETBUNDLER}" = "true" ]; then
    $nanolayer_location \
        install \
        devcontainer-feature \
        "ghcr.io/devcontainers-extra/features/gh-release:1" \
        --option repo='jsonnet-bundler/jsonnet-bundler' \
        --option binaryNames='jb' \
        --option version="$JSONNETBUNDLERVERSION"
fi

echo 'Done!'
