#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tox --version" tox --version

reportResults
