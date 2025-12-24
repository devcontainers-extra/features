#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "projen --version" projen --version

reportResults
