#!/usr/bin/env bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "mise version is equal to 2025.2.0" sh -c "mise -v | grep '2025.2.0'"

# Report result
reportResults