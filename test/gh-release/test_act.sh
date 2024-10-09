#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "act --version" act --version

reportResults
