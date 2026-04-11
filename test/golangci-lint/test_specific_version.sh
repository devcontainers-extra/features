#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "golangci-lint version is equal to 2.11.3" sh -c "golangci-lint --version | grep '2.11.3'"

reportResults
