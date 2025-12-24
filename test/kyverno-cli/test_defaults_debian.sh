#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "kyverno version" kyverno version

reportResults
