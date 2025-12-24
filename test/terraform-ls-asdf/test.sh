#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "terraform-ls --version" terraform-ls --version

reportResults
