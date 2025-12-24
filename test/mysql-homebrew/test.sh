#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "mysql --version" mysql --version

reportResults
