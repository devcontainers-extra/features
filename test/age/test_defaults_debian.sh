#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "age --version" age --version

reportResults
