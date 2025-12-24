#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "pipenv --version" pipenv --version

reportResults
