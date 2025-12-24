#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "twine --version" twine --version

reportResults
