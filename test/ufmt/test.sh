#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ufmt --version" ufmt --version

reportResults
