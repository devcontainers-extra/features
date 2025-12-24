#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "scheme  --help" scheme  --help

reportResults
