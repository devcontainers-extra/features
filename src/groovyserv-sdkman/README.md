
# GroovyServ (via SDKMAN) (groovyserv-sdkman)

GroovyServ reduces startup time of the JVM for runnning Groovy significantly. It
depends on your environments, but in most cases, it’s 10 to 20 times faster than
regular Groovy.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/groovyserv-sdkman:2": {}
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
