#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ruff --version" ruff --version

reportResults
