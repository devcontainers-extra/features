#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "exercism version" exercism version

reportResults
