#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "nim --version" nim --version

reportResults
