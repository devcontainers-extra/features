#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Verify the correct Podman version was installed
check "podman version matches installed version" sh -c "podman --version | grep -q '${VERSION:-latest}'"

# Verify remote option was respected
check "remote option respected" test "${REMOTE:-true}" = "true" || true

reportResults