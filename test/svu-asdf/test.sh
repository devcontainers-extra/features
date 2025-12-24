#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "svu --version" svu --version

reportResults
