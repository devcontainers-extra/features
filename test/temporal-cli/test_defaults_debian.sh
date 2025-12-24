#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "temporal --version" temporal --version

reportResults
