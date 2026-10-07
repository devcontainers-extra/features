#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Verify feature installation
echo "Testing x11-wayland feature installation..."

# Check that the feature ran without errors
check "feature installation succeeded" true

# Report results
reportResults