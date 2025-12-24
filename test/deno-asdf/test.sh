#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "deno --version" deno --version

reportResults
