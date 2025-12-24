#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gt --help" gt --help

reportResults
