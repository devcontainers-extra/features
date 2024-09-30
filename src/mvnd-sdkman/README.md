
# Maven Daemon (via SDKMAN) (mvnd-sdkman)

The mvnd project aims to provide a daemon infrastructure for maven based builds.
It borrows techniques from Gradle and Takari to provide a simple and efficient
system.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/mvnd-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Maven Daemon to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
