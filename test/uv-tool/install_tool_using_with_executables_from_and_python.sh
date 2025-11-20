#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ansible is installed" ansible --version
check "ansible-core executables are available" ansible-playbook --version
check "ansible-lint is available" ansible-lint --version

check "ansible uses Python 3.13" sh -c "ansible --version | grep 'python version = 3.13'"

reportResults
