#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "CodeBuddy version is equal to 2.16.0" sh -c "codebuddy --version | grep '2.16.0'"

reportResults
