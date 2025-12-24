#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "protoc --version" protoc --version

reportResults
