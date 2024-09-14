#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "edge-impulse-daemon --version" edge-impulse-daemon --version

reportResults
