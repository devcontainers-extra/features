#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mount folder exists" stat /.aws
check "environment variable AWS_CONFIG_FILE set" [ -n "$AWS_CONFIG_FILE" ] && echo "set" || echo "not set"
check "environment variable AWS_SHARED_CREDENTIALS_FILE set" [ -n "$AWS_SHARED_CREDENTIALS_FILE" ] && echo "set" || echo "not set"

reportResults
