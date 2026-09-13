#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "valkey version is equal to 8.1.10" sh -c "valkey-server --version | grep 'v=8.1.10'"

reportResults