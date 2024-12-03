#!/bin/bash

set -e

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
PACKAGES="${PACKAGES:-""}"

if [ "$(id -u)" -ne 0 ]; then
    echo "Script must be run as root. Use sudo, su, or add \"USER root\" to your Dockerfile before running this script."
    exit 1
fi

. ./utils.sh

install_webi "$(determine_user "$USERNAME")" "$PACKAGES"

clean
