#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "dasel --version" dasel --version

reportResults
