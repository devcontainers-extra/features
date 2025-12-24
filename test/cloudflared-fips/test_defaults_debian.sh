#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cloudflared --version" cloudflared --version

reportResults
