#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ansible version is equal to 2.13.0" bash -c "ansible --version | grep 'core 2.13.0'"

reportResults
