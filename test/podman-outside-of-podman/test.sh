#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Verify Podman installation
echo "Testing podman-outside-of-podman feature installation..."

# Check that podman is installed
check "podman binary exists" test -x "$(command -v podman)"

# Check podman version
check "podman --version succeeds" podman --version

# Report results
reportResults