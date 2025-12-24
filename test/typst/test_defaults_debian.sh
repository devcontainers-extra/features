#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "typst --version" typst --version

reportResults
