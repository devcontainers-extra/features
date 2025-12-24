#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "keeper --version" keeper --version

reportResults
