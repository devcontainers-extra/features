#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type lite-server" type lite-server

reportResults
