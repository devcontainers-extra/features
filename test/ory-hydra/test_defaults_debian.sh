#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "hydra version" hydra version

reportResults
