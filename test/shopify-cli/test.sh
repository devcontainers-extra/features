#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "shopify --version" shopify --version

reportResults
