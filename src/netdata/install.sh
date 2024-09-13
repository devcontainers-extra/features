#!/bin/bash -i

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.4.29"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/curl-apt-get:1.0.7"

curl https://get.netdata.cloud/kickstart.sh >/tmp/netdata-kickstart.sh &&
    sh /tmp/netdata-kickstart.sh --no-updates --stable-channel --disable-telemetry &&
    rm /tmp/netdata-kickstart.sh
