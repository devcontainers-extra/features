#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tfsec --version" tfsec --version

reportResults
