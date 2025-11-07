#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "btm version is equal to 0.11.0" sh -c "btm --version | grep '0.11.0'"

reportResults
