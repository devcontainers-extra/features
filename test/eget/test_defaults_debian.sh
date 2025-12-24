#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "eget --version" eget --version

reportResults
