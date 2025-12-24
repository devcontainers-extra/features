#!/bin/bash

set -e

source dev-container-features-test-lib

check "zig version" zig version

reportResults
