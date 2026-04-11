#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "archon version is equal to 0.3.4" sh -c "archon version | grep '0.3.4'"

reportResults
