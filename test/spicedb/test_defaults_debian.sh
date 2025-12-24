#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "spicedb version" spicedb version

reportResults
