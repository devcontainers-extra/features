#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "cloud-nuke --version" cloud-nuke --version

reportResults
