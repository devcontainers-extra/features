#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "datadog-ci version" datadog-ci version

reportResults
