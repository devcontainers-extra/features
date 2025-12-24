#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ng --help" ng --help

reportResults
