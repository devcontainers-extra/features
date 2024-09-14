#!/bin/bash -i

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.4.45"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.4" \
    --option packages='build-essential,autoconf,m4,libncurses5-dev,libwxgtk3.0-gtk3-dev,libwxgtk-webview3.0-gtk3-dev,libgl1-mesa-dev,libglu1-mesa-dev,libpng-dev,libssh-dev,unixodbc-dev,xsltproc,fop,libxml2-utils,libncurses-dev,openjdk-11-jdk,procps'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/asdf-package:1.0.8" \
    --option plugin='erlang' --option version="$ERLANGVERSION"
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.4" \
    --option packages='xz-utils'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/asdf-package:1.0.8" \
    --option plugin='rabbitmq' --option version="$VERSION" --option latestVersionPattern='v'
    


echo 'Done!'

