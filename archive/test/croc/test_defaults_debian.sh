#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "croc --version" croc --version

reportResults
