#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "theos is installed" "$THEOS"

reportResults
