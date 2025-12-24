#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cdk --version" cdk --version

reportResults
