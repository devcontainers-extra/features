#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "infisical version is equal to 0.43.45" sh -c "infisical --version | grep '0.43.45'"

reportResults
