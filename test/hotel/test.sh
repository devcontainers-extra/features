#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "hotel --version" hotel --version

reportResults
