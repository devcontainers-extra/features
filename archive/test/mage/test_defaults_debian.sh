#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "mage --version" mage --version

reportResults
