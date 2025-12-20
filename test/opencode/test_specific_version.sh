#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "opencode version is equal to 1.0.176" sh -c "opencode --version | grep '1.0.176'"

reportResults
