#!/usr/bin/env bash

set -e

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
VERSION=${VERSION:-"lts"}
PACKAGES="${PACKAGES:-""}"

if [ "$(id -u)" -ne 0 ]; then
    echo "Script must be run as root. Use sudo, su, or add \"USER root\" to your Dockerfile before running this script."
    exit 1
fi

. ./utils.sh

USERNAME=$(determine_user $USERNAME)

install_webi ${USERNAME} "node@${VERSION}"

su - ${USERNAME} <<EOF
    if [ -n "$PACKAGES" ]; then
      echo "Installing global npm packages: $PACKAGES..."
      npm install -g $(echo "$PACKAGES" | tr ',' ' ')
    fi
EOF

clean

echo "Node.js and npm installation complete."