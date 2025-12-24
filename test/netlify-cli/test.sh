#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "netlify --version" netlify --version

reportResults
