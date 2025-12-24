#!/bin/bash

set -e

source dev-container-features-test-lib

check " pnpm -v | grep 8.3.1" pnpm -v | grep 8.3.1

reportResults
