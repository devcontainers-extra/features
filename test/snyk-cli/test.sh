#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "snyk --version" snyk --version

reportResults
