#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "datasette --version" datasette --version

reportResults
