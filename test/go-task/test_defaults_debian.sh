#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "task --version" task --version

reportResults
