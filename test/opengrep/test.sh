#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "opengrep is installed" opengrep --version

reportResults
