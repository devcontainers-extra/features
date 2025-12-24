#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tofu is installed" tofu --version

reportResults
