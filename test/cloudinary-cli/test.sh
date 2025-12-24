#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cld --version" cld --version

reportResults
