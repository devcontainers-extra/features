#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ty is installed" ty --version

reportResults
