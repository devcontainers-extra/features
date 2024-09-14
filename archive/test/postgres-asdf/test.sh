#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "postgres -V" postgres -V

reportResults
