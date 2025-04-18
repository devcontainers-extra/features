#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "Claude Code version is equal to 0.2.70" sh -c "claude --version | grep '0.2.70'"

reportResults
