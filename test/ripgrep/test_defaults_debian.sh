#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "rg --version" rg --version

reportResults
