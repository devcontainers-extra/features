#!/bin/bash

set -e

source dev-container-features-test-lib

check "doctl cli existance" doctl version

reportResults
