#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "dnote version" dnote version

reportResults
