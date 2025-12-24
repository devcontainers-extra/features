#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "blackbox_exporter --version" blackbox_exporter --version

reportResults
