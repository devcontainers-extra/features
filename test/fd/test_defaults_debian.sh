#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "fd --version" fd --version

reportResults
