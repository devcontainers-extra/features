#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tfenv --version" tfenv --version

reportResults
