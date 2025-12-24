#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "actionlint --version" actionlint --version

reportResults
