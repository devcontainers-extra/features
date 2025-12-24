#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "k6 version" k6 version

reportResults
