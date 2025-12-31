#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "infisical is installed" infisical --version

reportResults
