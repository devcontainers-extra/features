#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "how2 --version" how2 --version

reportResults
