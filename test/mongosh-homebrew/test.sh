#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mongosh --version" mongosh --version

reportResults
