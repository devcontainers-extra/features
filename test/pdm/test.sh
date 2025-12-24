#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pdm --version" pdm --version

reportResults
