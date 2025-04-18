#!/usr/bin/env bash

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.6"

# Check if claude-code is installed
if ! command -v claude-code &> /dev/null; then
    echo "Error: claude-code is required but not installed. Please install it first."
    exit 1
fi

# Install Claude YOLO globally via npm
if [ "${VERSION}" = "latest" ]; then
    npm install -g "claude-yolo"
else
    npm install -g "claude-yolo@${VERSION}"
fi

echo 'Claude YOLO installed successfully!'
