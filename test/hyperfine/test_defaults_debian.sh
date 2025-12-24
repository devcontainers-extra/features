#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "hyperfine --version" hyperfine --version

reportResults
