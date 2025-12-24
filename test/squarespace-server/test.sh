#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "squarespace-server --version" squarespace-server --version

reportResults
