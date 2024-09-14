#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "airplane --version" airplane --version

reportResults
