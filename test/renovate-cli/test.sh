#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "renovate --version" renovate --version

reportResults
