#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jsonnet is installed" jsonnet --version
check "jsonnet-deps is installed" jsonnet-deps --version
check "jsonnetfmt is installed" jsonnetfmt --version
check "jsonnet-lint is installed" jsonnet-lint --version
check "jb is installed" jb --version

reportResults
