#!/usr/bin/env bash

set -e

source dev-container-features-test-lib
{{- $binaryNames := splitList "," .BinaryNames}}
{{- $versionCommands := splitList "," .BinaryVersionCommands}}
{{- range $index, $binary := $binaryNames}}
{{- $versionCmd := "--version"}}
{{- if gt (len $versionCommands) 1}}
{{- $versionCmd = index $versionCommands $index}}
{{- else if eq (len $versionCommands) 1}}
{{- $versionCmd = index $versionCommands 0}}
{{- end}}

check "{{$binary}} is installed" {{$binary}} {{$versionCmd}}
{{- end}}

reportResults
