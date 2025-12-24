#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "wg --version" wg --version

reportResults
