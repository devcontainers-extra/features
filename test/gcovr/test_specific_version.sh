#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gcovr version is equal to 8.1" sh -c "gcovr --version | grep 'gcovr 8.1'"

reportResults
