#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pushgateway --version" pushgateway --version

reportResults
