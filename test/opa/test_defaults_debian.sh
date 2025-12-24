#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "opa version" opa version

reportResults
