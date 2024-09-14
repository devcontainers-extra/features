#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "xplr --version" xplr --version

reportResults
