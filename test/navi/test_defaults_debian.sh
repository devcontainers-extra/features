#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "navi --version" navi --version

reportResults
