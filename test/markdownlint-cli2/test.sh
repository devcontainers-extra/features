#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "hash markdownlint-cli2" hash markdownlint-cli2

reportResults
