#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "namespace-cli version is equal to v0.0.393" sh -c "nsc version | grep 'v0.0.393'"
# docker-credential-nsc doesn't have a version indicator as of v0.0.393
# check "namespace-cli docker credential helper version is equal to v0.0.393" sh -c "docker-credential-nsc --help | grep 'v0.0.393'"

reportResults