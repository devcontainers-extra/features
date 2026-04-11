#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "archon is installed" archon version

reportResults
