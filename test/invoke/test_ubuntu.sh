#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "invoke --version" invoke --version

reportResults
