#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mkdocs --version" mkdocs --version

reportResults
