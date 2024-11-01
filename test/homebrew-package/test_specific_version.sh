#!/bin/bash

set -e

source dev-container-features-test-lib

check "type node" type node

check "node version is 22" sh -c "node --version | grep 'v22.*'"

reportResults
