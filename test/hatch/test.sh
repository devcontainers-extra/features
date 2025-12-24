#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "hatch --version" hatch --version

reportResults
