#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "spacectl --version" spacectl --version

reportResults
