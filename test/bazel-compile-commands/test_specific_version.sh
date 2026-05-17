#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

which bazel-compile-commands
check "bazel-compile-commands version is 0.22.4" sh -c "bazel-compile-commands --version 2>&1 | grep '0.22.4'"
check "bazelisk is installed" bazelisk --version

reportResults
