#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "meteor --version" meteor --version

reportResults
