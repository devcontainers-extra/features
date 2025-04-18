#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "claude-yolo is installed" claude-yolo --version

reportResults
