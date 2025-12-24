#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "corepack --version" corepack --version

reportResults
