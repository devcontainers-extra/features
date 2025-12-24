#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tempo --version && type tempo-cli && type tempo-query" tempo --version && type tempo-cli && type tempo-query

reportResults
