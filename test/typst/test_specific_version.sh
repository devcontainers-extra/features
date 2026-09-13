#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "typst version is equal to 0.13.0" sh -c "typst --version | grep '0.13.0'"

reportResults
