#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gh --version" gh --version

reportResults
