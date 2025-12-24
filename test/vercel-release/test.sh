#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "release --version" release --version

reportResults
