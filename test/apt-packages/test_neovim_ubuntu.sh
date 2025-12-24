#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "nvim --version" nvim --version

reportResults
