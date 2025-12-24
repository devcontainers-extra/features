#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "age --version" age --version

reportResults
