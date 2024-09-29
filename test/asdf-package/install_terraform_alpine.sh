#!/bin/bash

set -e

source dev-container-features-test-lib


check "asdf list terraform" asdf list terraform


reportResults
