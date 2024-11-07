#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "type trello" type trello

reportResults
