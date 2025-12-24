#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "uv version is equal to 0.8.14" sh -c "uv --version | grep '0.8.14'"

reportResults
