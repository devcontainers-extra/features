#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "prek version is equal to 0.3.6" sh -c "prek --version | grep '0.3.6'"

reportResults
