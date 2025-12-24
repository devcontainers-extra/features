#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jake --version" jake --version

reportResults
