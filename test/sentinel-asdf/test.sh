#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sentinel --version" sentinel --version

reportResults
