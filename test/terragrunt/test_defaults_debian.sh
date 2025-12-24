#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "terragrunt --version" terragrunt --version

reportResults
