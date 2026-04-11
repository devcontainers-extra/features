#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gofumpt is installed" gofumpt --version

reportResults
