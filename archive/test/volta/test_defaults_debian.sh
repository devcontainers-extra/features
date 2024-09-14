#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "volta --version" volta --version

reportResults
