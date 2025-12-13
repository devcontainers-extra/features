#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "elasticsearch --version" elasticsearch --version

reportResults
