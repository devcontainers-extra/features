#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "stencil --version" stencil --version

reportResults
