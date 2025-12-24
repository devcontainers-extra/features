#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "direnv --version" direnv --version

reportResults
