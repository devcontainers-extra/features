
# Gradle (via SDKMAN) (gradle-sdkman)

Gradle is a build automation tool that builds upon the concepts of Apache Ant
and Apache Maven and introduces a Groovy-based domain-specific language (DSL)
instead of the more traditional XML form of declaring the project configuration.
Gradle uses a directed acyclic graph (DAG) to determine the order in which tasks
can be run.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/gradle-sdkman:2": {}
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
