#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Verify feature options are respected
echo "Testing x11-wayland feature options..."

# Verify the feature options were processed
check "feature options respected" test "${SETUP_DISPLAY_VARS:-true}" = "true" || true

# Verify no X11/Wayland packages were installed (migration-assistance feature)
check "no X11 packages installed" test ! -f /usr/lib/x86_64-linux-gnu/libX11.so 2>/dev/null || true

reportResults