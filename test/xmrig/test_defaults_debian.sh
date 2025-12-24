#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "xmrig --version" xmrig --version

reportResults
