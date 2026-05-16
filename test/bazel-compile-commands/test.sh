#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "bazel-compile-commands is installed" bazel-compile-commands --version
check "bazelisk is installed" bazelisk --version

reportResults
