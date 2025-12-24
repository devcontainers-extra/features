#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "gitmux -V" gitmux -V

reportResults
