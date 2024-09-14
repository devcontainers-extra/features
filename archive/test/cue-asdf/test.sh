#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cue version" cue version

reportResults
