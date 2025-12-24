#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "checkov -v" checkov -v

reportResults
