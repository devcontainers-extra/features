#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ncc --version" ncc --version

reportResults
