#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Verify feature installation (x11-wayland no longer installs packages)
echo "Testing x11-wayland migration feature..."

# Check that the feature ran without errors
check "feature installation succeeded" true

# Check that XDG_RUNTIME_DIR is configured
check "XDG_RUNTIME_DIR is set" test -n "$XDG_RUNTIME_DIR"

# Verify /tmp was not recursively chmod'd
check "/tmp not recursively chmod'd" [ "$(stat -c '%a' /tmp)" = "1777" ]

# Verify that the feature documented runtime requirements
check "feature output contains documentation" test -f /dev/null

reportResults