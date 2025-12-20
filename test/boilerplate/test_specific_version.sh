#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "boilerplate version is equal to 0.10.0" sh -c "boilerplate --version | grep '0.10.0'"

reportResults
