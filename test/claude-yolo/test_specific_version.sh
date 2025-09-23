#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Check that Claude Code is installed and Claude YOLO has the specific version
check "claude-yolo version is equal to 1.6.4" sh -c "claude-yolo --version | grep '1.6.4'"

reportResults
