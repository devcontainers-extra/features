#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "typescript is installed (via bun-package)" bunx tsc --version

reportResults
