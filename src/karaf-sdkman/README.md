
# Karaf (via SDKMAN) (karaf-sdkman)

Apache Karaf is a polymorphic, lightweight, powerful, and enterprise ready
applications runtime. It provides all the ecosystem and bootstrapping options
you need for your applications. It runs on premise or on cloud. By polymorphic,
it means that Karaf can host any kind of applications: WAR, OSGi, Spring, and
much more.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/karaf-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. (see jdk version which karaf supports here https://karaf.apache.org/get-started) | string | 11 |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
