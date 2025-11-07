#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "btm --version" btm --version

reportResults
