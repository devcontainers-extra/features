#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "apko version" apko version

reportResults
