#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "vercel --version" vercel --version

reportResults
