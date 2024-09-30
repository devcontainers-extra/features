
# Joern (via SDKMAN) (joern-sdkman)

Joern is a platform for analyzing source code, bytecode, and binary executables.
It generates code property graphs (CPGs), a graph representation of code for
cross-language code analysis. Code property graphs are stored in a custom graph
database. This allows code to be mined using search queries formulated in a
Scala-based domain-specific query language. Joern is developed with the goal of
providing a useful tool for vulnerability discovery and research in static
program analysis.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/joern-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
