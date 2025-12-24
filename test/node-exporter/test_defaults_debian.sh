#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "node_exporter --version" node_exporter --version

reportResults
