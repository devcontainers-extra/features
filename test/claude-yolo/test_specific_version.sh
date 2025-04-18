#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Check that Claude Code is installed and Claude YOLO has the specific version
check "Claude Code is installed" claude-code --version
check "Claude YOLO version is equal to 0.1.0" sh -c "claude-yolo --version | grep '0.1.0'"

reportResults
