#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "httpie is installed" http --version

reportResults
