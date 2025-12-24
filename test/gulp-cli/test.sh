#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gulp --version" gulp --version

reportResults
