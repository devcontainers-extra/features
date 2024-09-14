#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "rabbitmqctl --version" rabbitmqctl --version

reportResults
