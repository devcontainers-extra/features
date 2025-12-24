#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "fulcio version" fulcio version

reportResults
