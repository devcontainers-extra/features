#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tmate -V" tmate -V

reportResults
