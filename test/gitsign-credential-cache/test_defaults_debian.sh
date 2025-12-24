#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gitsign-credential-cache --version" gitsign-credential-cache --version

reportResults
