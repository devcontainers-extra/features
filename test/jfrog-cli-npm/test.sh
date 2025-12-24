#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jf --version" jf --version

reportResults
