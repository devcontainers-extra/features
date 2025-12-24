#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gitsign version" gitsign version

reportResults
