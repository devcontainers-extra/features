#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tridentctl --help" tridentctl --help

reportResults
