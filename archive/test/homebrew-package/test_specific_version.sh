#!/bin/bash

set -e

source dev-container-features-test-lib

check "type node" type node

check "node version is 14"  node --version | grep "v14.*"

reportResults
