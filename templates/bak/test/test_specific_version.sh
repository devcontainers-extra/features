#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "something version is equal to x.y.z" sh -c "something --version | grep 'x.y.z'"

reportResults
