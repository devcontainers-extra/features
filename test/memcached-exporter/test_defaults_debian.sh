#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "memcached_exporter --version" memcached_exporter --version

reportResults
