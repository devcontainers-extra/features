#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cas --version" cas --version

reportResults
