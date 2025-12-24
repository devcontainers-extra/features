#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "eb --version" eb --version

reportResults
