#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "http-server --version" http-server --version

reportResults
