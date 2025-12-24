#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "oclif --version" oclif --version

reportResults
