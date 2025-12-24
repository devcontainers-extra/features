#!/usr/bin/env bash

set -e

source dev-container-features-test-lib

check "type pdfattach" type pdfattach

check "type pdfdetach" type pdfdetach

check "type pdffonts" type pdffonts

check "type pdfimages" type pdfimages

check "type pdfinfo" type pdfinfo

check "type pdfseparate" type pdfseparate

check "type pdftocairo" type pdftocairo

check "type pdftohtml" type pdftohtml

check "type pdftoppm" type pdftoppm

check "type pdftops" type pdftops

check "type pdftotext" type pdftotext

check "type pdfunite" type pdfunite

reportResults
