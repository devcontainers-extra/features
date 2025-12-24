#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "lefthook --help" lefthook --help

reportResults
