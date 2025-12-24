#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "micro --version" micro --version

reportResults
