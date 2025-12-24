#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "age-keygen --version" age-keygen --version

reportResults
