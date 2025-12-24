#!/bin/bash

set -e

source dev-container-features-test-lib

check "npm list --global --parseable --depth 0 --omit dev  | grep typescript" npm list --global --parseable --depth 0 --omit dev | grep "typescript"

reportResults
