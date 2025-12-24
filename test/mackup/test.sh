#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mackup --version" mackup --version

reportResults
