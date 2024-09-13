
set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers/features/python:1.0.18" \
    --option installTools='false' --option version='os-provided'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='pip3 install packaging==21.3'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/pipx-package:1.1.8" \
    --option package='eth-brownie' --option version="$VERSION"
    


echo 'Done!'

