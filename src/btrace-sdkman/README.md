
# BTrace (via SDKMAN) (btrace-sdkman)

BTrace is a safe, dynamic tracing tool for the Java platform. BTrace can be used
to dynamically trace a running Java program (similar to DTrace for OpenSolaris
applications and OS). BTrace dynamically instruments the classes of the target
application to inject bytecode tracing code.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/btrace-sdkman:2": {}
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
