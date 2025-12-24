#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "aws-sso version is equal to 1.16.1" sh -c "aws-sso version | grep '1.16.1'"

reportResults
