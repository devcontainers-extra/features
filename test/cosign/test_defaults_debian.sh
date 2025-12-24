#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cosign version" cosign version

reportResults
