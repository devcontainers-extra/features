#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "linkerd --help" linkerd --help

reportResults
