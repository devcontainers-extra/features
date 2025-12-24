#!/usr/bin/env bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

# Definition specific tests
check "version" mise -v

# Report result
reportResults