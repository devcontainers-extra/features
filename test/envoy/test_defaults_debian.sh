#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "envoy --version" envoy --version

reportResults
