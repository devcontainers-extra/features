#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "quasar --version" quasar --version

reportResults
