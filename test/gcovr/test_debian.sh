#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gcovr is installed" gcovr --version

reportResults
