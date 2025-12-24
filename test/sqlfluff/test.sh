#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sqlfluff --version" sqlfluff --version

reportResults
