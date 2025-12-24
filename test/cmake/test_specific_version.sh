#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cmake version is equal to 3.31.3" sh -c "cmake --version | grep '3.31.3'"
check "ctest version is equal to 3.31.3" sh -c "ctest --version | grep '3.31.3'"
check "cpack version is equal to 3.31.3" sh -c "cpack --version | grep '3.31.3'"

reportResults
