#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "Claude Code is installed" claude-code --version

reportResults
