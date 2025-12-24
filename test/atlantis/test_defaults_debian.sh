#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "atlantis version" atlantis version

reportResults
