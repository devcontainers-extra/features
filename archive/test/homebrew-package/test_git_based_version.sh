#!/bin/bash

set -e

source dev-container-features-test-lib

check "type curl" type curl

check "curl version is 7.80.0"  curl --version | grep "7.80.0"

reportResults
