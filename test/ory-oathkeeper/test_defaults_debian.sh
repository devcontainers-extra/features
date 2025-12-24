#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "oathkeeper version" oathkeeper version

reportResults
