#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jsonnet version is equal to 0.20.0" sh -c "jsonnet --version | grep 'v0.20.0'"

check "jsonnet-deps is installed" jsonnet-deps --version
check "jsonnetfmt is installed" jsonnetfmt --version
check "jsonnet-lint is installed" jsonnet-lint --version

reportResults
