#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "chisel --version" chisel --version

reportResults
