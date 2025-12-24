#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "isort --version" isort --version

reportResults
