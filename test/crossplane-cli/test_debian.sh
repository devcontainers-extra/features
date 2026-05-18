#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "crossplane is installed" crossplane -h

reportResults
