#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "terragrunt --version" terragrunt --version
check "terragrunt version is equal to 0.96.0" sh -c "terragrunt --version | grep '0.96.0'"

reportResults
