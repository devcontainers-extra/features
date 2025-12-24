#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "curl --version" curl --version

reportResults
