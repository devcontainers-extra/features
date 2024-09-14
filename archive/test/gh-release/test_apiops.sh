#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type extractor" type extractor

reportResults
