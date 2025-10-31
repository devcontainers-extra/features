#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "dart version is equal to 3.9.4" sh -c "dart --version | grep '3.9.4'"

reportResults
