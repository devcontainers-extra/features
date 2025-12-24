#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "raku --version" raku --version

reportResults
