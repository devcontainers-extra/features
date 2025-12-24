#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "lt --version" lt --version

reportResults
