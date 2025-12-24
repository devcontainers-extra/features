#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "hcloud package is injected" bash -c "pipx list --include-injected | grep hcloud"

reportResults
