#!/bin/bash

set -e

source dev-container-features-test-lib


check "terrascan version" terrascan version

reportResults
