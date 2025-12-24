#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "redis-cli --version" redis-cli --version

reportResults
