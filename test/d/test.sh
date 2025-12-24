#!/bin/bash

set -e

source dev-container-features-test-lib

check "dlang dir exists" ls /usr/local/lib/dlang

reportResults
