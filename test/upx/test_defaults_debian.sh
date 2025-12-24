#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "upx --version" upx --version

reportResults
