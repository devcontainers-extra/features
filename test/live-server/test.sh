#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "live-server --version" live-server --version

reportResults
