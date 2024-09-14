#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "meson --version" meson --version

reportResults
