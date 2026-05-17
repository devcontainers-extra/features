#!/usr/bin/env bash

set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# Upstream tags use a non-standard "bazel-compile-commands-v<ver>" format. Normalise
# any plain version (e.g. "0.22.4" or "v0.22.4") so nanolayer can match it exactly.
if [[ "${VERSION}" != "latest" && "${VERSION}" != bazel-compile-commands-* ]]; then
    VERSION="bazel-compile-commands-v${VERSION#v}"
fi

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/gh-release:1" \
    --option repo='kiron1/bazel-compile-commands' \
    --option binaryNames='bazel-compile-commands' \
    --option version="$VERSION" \
    --option assetRegex='linux_' \
    --option releaseTagRegex='bazel-compile-commands-v'

echo 'Done!'
