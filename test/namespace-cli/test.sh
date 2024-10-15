#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "nsc version" nsc version
check "docker-credential-nsc --help" docker-credential-nsc --help

reportResults
