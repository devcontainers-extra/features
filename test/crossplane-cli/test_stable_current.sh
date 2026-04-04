#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "crossplane version is v2" sh -c "crossplane version 2>&1 | grep 'Client Version: v2'"

reportResults
