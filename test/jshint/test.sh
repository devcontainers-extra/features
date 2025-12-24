#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jshint --version" jshint --version

reportResults
