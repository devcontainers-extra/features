#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "dart is installed" dart --version

reportResults
