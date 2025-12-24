#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "waypoint --version" waypoint --version

reportResults
