#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "prek --version" prek --version

reportResults
