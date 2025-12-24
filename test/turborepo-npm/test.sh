#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "turbo --version" turbo --version

reportResults
