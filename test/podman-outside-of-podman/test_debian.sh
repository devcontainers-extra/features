#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Verify Podman is installed and executable
check "podman is installed" test -x "$(command -v podman)"

# Verify podman version is valid
check "podman --version returns valid output" podman --version | grep -qE '^[0-9]'

# Verify remote mode configuration (when enabled)
if [ "${REMOTE:-true}" = "true" ]; then
    check "podman --remote --help succeeds" podman --remote --help 2>/dev/null || true
fi

reportResults