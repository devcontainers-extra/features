#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "golangci-lint is installed" golangci-lint --version

reportResults
