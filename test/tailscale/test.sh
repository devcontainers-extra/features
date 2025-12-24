#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "tailscale --version" tailscale --version

reportResults
