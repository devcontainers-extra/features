#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "helmfile is installed" helmfile --version

reportResults
