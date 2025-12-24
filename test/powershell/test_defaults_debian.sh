#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pwsh --version" pwsh --version

reportResults
