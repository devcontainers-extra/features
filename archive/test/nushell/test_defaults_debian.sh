#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "nu --version" nu --version

reportResults
