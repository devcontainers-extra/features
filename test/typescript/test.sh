#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tsc --version" tsc --version

reportResults
