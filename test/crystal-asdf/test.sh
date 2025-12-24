#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "crystal --version" crystal --version

reportResults
