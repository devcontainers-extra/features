#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "duf --version" duf --version

reportResults
