#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "sqlfmt --version" sqlfmt --version

reportResults
