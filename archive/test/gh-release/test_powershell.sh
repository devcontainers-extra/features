#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pwsh --version" pwsh --version

reportResults
