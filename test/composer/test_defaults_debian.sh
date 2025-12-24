#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "composer --version" composer --version

reportResults
