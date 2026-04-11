#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "wt version is equal to 0.35.2" sh -c "wt --version 2>&1 | grep '0.35.2'"

reportResults
