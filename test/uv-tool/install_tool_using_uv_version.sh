#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "uv tool version" sh -c "uv --version | grep 0.9.6"
check "httpie is installed" http --version

reportResults
