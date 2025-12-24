#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "exa --version" exa --version

reportResults
