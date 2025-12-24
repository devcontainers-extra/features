#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tkn version" tkn version

reportResults
