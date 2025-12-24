#!/bin/bash

set -e

source dev-container-features-test-lib

check " pnpm -v | grep 7.26.3" pnpm -v | grep 7.26.3

reportResults
