#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "terraform-docs --version" terraform-docs --version

reportResults
