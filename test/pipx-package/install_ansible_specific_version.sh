#!/bin/bash

set -e

source dev-container-features-test-lib

ansible --version
check "ansible-core version is equal to 2.16.11" bash -c 'ansible --version | grep "core 2.16.11"'
check "ansible version is equal to 9.10.x" bash -c 'pipx list --include-injected | grep "ansible 9.10."'

reportResults
