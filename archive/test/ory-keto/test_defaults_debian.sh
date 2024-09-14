#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "keto version" keto version

reportResults
