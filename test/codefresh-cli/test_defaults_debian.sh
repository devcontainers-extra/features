#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "codefresh version" codefresh version

reportResults
