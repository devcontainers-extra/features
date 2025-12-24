#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "haxe --version" haxe --version

reportResults
