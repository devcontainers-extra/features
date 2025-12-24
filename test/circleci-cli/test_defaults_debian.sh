#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "circleci version" circleci version

reportResults
