#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "shellcheck is installed" shellcheck --version

reportResults
