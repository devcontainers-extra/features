#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "xonsh --version" xonsh --version

reportResults
