#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cmctl --help" cmctl --help

reportResults
