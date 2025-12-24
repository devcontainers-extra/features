#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ts-node --version" ts-node --version

reportResults
