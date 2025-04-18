#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "Claude Code version is equal to 0.2.72" sh -c "claude-code --version | grep '0.2.72'"

reportResults
