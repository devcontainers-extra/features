#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "kind --version" kind --version

reportResults
