#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "meltano --version" meltano --version

reportResults
