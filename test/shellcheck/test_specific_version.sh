#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "shellcheck version is equal to 0.9.0" sh -c "shellcheck --version | grep '0.9.0'"

reportResults
