#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "browserify --version" browserify --version

reportResults
