#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sigstore --version" sigstore --version

reportResults
