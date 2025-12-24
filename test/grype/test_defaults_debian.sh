#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "grype version" grype version

reportResults
