#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "dbt-coverage --help" dbt-coverage --help

reportResults
