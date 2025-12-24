#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "stew --version" stew --version

reportResults
