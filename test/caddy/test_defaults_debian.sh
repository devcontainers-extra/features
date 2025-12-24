#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "caddy version" caddy version

reportResults
