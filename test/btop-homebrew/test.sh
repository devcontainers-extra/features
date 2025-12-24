#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "btop --version" btop --version

reportResults
