#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gu --help" gu --help

reportResults
