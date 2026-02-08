#!/usr/bin/env bash

set -e

# shellcheck disable=SC1091
# dev-container-features-test-lib is provided by the test framework at runtime
source dev-container-features-test-lib

check "bun version is equal to 1.2.20" sh -c "bun --version | grep '^1.2.20'"

reportResults
