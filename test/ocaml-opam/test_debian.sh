#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "opam is installed" opam --version
check "OCaml is installed" ocamlc --version
check "UTop is installed" utop -version

check "no opam warning" sh -c "test $(opam switch 2>&1 | grep --count 'WARNING') -eq 0"

reportResults
