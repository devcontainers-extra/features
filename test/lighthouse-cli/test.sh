#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "lighthouse --version" lighthouse --version

reportResults
