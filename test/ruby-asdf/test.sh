#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ruby --version" ruby --version

reportResults
