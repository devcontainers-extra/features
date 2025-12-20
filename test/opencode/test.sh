#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "opencode is installed" opencode --version

reportResults
