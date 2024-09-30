
# JDK Mission Control (via SDKMAN) (jmc-sdkman)

Java Flight Recorder and JDK Mission Control together create a complete tool
chain to continuously collect low level and detailed runtime information
enabling after-the-fact incident analysis. JDK Mission Control is an advanced
set of tools that enables efficient and detailed analysis of the extensive of
data collected by Java Flight Recorder. The tool chain enables developers and
administrators to collect and analyze data from Java applications running
locally or deployed in production environments.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/jmc-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of JDK Mission Control to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | oracle |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
