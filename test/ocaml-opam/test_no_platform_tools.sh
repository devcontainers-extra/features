#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "no utop" sh -c "! command -v utop"

reportResults
