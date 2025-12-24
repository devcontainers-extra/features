#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tfswitch --version" tfswitch --version

reportResults
