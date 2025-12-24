#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "yt-dlp --version" yt-dlp --version

reportResults
