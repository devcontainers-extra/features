#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "orca --version" orca --version

reportResults
