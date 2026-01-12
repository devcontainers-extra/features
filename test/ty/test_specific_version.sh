#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ty version is equal to 0.0.10" sh -c "ty --version | grep '0.0.10'"

reportResults
