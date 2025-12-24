#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "expo --version" expo --version

reportResults
