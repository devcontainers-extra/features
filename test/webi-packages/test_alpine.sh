#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

source ~/.config/envman/PATH.env

check "node version is equal to 18.*.*" sh -c "node --version | grep '18.*.*'"

reportResults
