#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cmake is installed" cmake --version
check "ctest is installed" ctest --version
check "cpack is installed" cpack --version

reportResults
