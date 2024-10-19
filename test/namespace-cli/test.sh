#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "namespace-cli is installed" nsc version
check "namespace-cli docker credential helper is installed" docker-credential-nsc --help

reportResults
