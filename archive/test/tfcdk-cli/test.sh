#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cdktf --version" cdktf --version

reportResults
