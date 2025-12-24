#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "dufs --version" dufs --version

reportResults
