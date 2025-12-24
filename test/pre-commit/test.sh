#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pre-commit --version" pre-commit --version

reportResults
