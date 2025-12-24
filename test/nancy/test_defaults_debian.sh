#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "nancy --version" nancy --version

reportResults
