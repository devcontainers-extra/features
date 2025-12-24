#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "youtubeuploader --version" youtubeuploader --version

reportResults
