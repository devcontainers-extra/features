#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "json-server --version" json-server --version

reportResults
