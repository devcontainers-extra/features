#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "boundary version" boundary version

reportResults
