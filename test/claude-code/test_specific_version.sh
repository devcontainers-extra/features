#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "claude version is equal to 2.0.30" sh -c "claude --version | grep '2.0.30'"

reportResults
