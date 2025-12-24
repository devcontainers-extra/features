#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "locate --version" locate --version

reportResults
