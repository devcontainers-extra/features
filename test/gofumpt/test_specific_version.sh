#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gofumpt version is equal to 0.9.1" sh -c "gofumpt --version | grep '0.9.1'"

reportResults
