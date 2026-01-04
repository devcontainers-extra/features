#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "terragrunt --version" terragrunt --version
check "terragrunt version is equal to 0.93.5" sh -c "terragrunt --version | grep '0.93.5'"

reportResults
