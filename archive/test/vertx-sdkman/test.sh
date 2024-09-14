#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "vertx --version" vertx --version

reportResults
