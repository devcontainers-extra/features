#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "istioctl version" istioctl version

reportResults
