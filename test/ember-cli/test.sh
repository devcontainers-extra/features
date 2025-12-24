#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ember --version" ember --version

reportResults
