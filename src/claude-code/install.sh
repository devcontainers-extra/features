#!/usr/bin/env bash

set -e

# Install via Anthropic's recommended method
# Script downloaded from them:
# https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/bootstrap.sh
bash "$(dirname "$0")/bootstrap.sh" "$VERSION"

# Copy the binary to /usr/local/bin for global access
# It's installed in /root/.local/bin/claude and there's no option to override the install location
cp "$HOME/.local/bin/claude" /usr/local/bin/claude

echo 'Done!'
