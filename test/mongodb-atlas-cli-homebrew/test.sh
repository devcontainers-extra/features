#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type atlas" type atlas

reportResults
