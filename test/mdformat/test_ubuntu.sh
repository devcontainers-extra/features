#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mdformat --version" mdformat --version

reportResults
