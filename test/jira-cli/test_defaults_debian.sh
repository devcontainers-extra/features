#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jira version" jira version

reportResults
