#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jx version" jx version

reportResults
