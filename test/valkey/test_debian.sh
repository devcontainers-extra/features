#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "valkey-server is installed" valkey-server --version
check "valkey-cli is installed" valkey-cli --version

reportResults