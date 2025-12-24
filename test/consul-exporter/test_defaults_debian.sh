#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "consul_exporter --help" consul_exporter --help

reportResults
