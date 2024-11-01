#!/bin/bash

set -e

source dev-container-features-test-lib

check "cabal install --lib" ghc -e "import Test.Hspec; import Test.QuickCheck"

reportResults
