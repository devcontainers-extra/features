#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "immuadmin version" immuadmin version

reportResults
