#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "typescript version is equal to 5.5.4" sh -c "bunx tsc --version | grep '^Version 5.5.4'"

reportResults
