#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "opengrep version is equal to 1.18.0" sh -c "opengrep --version | grep '1.18.0'"

reportResults
