#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "supabase --version" supabase --version

reportResults
