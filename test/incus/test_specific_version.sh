#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "incus version is equal to 6.22" sh -c "incus --version | grep '6.22'"

reportResults
