#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tofu version is equal to 1.9.4" sh -c "tofu --version | grep '1.9.4'"

reportResults
