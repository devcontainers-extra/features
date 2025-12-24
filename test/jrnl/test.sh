#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jrnl --version" jrnl --version

reportResults
