#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pkg --version" pkg --version

reportResults
