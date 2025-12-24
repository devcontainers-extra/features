#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "statsd_exporter --version" statsd_exporter --version

reportResults
