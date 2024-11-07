#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cdktf --version" cdktf --version

reportResults
