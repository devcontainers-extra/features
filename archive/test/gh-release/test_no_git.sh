#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "aztfexport --version" aztfexport --version

reportResults
