#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "etcd --version" etcd --version

reportResults
