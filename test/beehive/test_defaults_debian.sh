#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "beehive --version" beehive --version

reportResults
