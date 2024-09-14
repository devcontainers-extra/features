#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "croc --version" croc --version

reportResults
