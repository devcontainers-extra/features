#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "k2tf --version" k2tf --version

reportResults
