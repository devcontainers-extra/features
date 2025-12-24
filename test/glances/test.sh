#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "glances --version" glances --version

reportResults
