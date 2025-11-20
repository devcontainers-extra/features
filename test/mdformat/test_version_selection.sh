#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mdformat --version | grep '0.7.16'" bash -c "mdformat --version | grep '0.7.16'"

reportResults
