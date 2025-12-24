#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "rekor-cli version" rekor-cli version

reportResults
