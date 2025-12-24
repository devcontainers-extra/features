#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "eza version is equal to 0.23.0" sh -c "eza --version | grep '0.23.0'"

reportResults
