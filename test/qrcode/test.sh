#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "qr --version" qr --version

reportResults
