#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "kratos version" kratos version

reportResults
