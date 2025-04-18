#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

# Check both Claude Code and Claude YOLO are installed
check "Claude Code is installed" claude-code --version
check "Claude YOLO is installed" claude-yolo --version

reportResults
