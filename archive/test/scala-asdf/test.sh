#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "scala --version" scala --version

reportResults
