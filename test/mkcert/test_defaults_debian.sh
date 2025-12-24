#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mkcert --version" mkcert --version

reportResults
