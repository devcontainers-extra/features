#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "ko version" ko version

reportResults
