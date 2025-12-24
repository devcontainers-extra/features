#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "talosctl is installed" talosctl version --client

reportResults
