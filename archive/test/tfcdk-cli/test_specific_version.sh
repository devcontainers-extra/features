#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cdktf --version | grep 0.17.0" cdktf --version | grep 0.17.0

reportResults
