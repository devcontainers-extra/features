#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "helmfile version is equal to 0.169.0" sh -c "helmfile --version | grep '0.169.0'"

reportResults
