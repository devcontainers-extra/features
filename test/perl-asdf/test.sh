#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "perl --version" perl --version

reportResults
