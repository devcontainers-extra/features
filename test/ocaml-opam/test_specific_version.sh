#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "OCaml version is equal to 4.14.2" sh -c "ocamlc --version | grep '4.14.2'"

reportResults
