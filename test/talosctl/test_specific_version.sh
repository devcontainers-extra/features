#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "talosctl version is equal to v1.8.0" sh -c "talosctl version --client | grep 'v1.8.0'"

reportResults