#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "netdata -version" netdata -version

reportResults
