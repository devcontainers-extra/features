#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "goose version is equal to 1.0.35" sh -c "goose --version | grep '1.0.35'"

reportResults
