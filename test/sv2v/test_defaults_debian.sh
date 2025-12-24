#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "sv2v --version" sv2v --version

reportResults
