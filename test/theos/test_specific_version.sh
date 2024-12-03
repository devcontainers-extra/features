#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "theos version is equal to 1.0.0" sh -c "theos --version | grep '1.0.0'"

reportResults
