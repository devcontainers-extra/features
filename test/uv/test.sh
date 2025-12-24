#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "uv is installed" uv --version

reportResults
