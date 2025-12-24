#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ls $(npm root -g)/@hyperupcall/autoenv/activate.sh" ls $(npm root -g)/@hyperupcall/autoenv/activate.sh

reportResults
