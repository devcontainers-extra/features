#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "aws-sso is installed" aws-sso version

reportResults
