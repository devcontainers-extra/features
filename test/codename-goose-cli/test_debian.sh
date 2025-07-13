#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "goose is installed" goose --version

reportResults
