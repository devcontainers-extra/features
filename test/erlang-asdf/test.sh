#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "erl -version" erl -version

reportResults
