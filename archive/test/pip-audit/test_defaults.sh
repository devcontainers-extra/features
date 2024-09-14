#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "pip-audit --version" pip-audit --version

reportResults
