#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "aztfexport --version" aztfexport --version

reportResults
