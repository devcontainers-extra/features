#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "epinio --version" epinio --version

reportResults
