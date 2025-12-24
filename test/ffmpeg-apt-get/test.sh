#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "ffmpeg -version" ffmpeg -version

reportResults
