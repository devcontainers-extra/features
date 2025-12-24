#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "alp --version" alp --version

reportResults
