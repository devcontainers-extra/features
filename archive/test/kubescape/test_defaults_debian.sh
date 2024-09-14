#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "kubescape version" kubescape version

reportResults
