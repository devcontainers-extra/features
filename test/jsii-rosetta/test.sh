#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "jsii-rosetta --version" jsii-rosetta --version

reportResults
