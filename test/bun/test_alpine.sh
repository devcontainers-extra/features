#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "bun is installed" bun --version

reportResults
