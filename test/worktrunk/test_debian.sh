#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "wt is installed" wt --version

reportResults
