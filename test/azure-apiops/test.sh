#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type extractor" type extractor

check "type publisher" type publisher

reportResults
