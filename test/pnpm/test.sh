#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pnpm -v" pnpm -v

reportResults
