#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "lerna --version" lerna --version

reportResults
