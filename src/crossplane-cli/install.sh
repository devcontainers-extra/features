#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/apt-get-packages:1.0.6" \
    --option packages='curl,ca-certificates'

export XP_VERSION="${VERSION:-"current"}"
export XP_CHANNEL="${CHANNEL:-"stable"}"

curl -sSL "https://raw.githubusercontent.com/crossplane/crossplane/main/install.sh" | sh

chmod +x crossplane
mv crossplane /usr/local/bin

echo 'Done!'
