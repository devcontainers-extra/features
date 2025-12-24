
# Erlang (via asdf) (erlang-asdf)

Erlang is a programming language used to build massively scalable soft real-time systems with requirements on high availability. Some of its uses are in telecoms, banking, e-commerce, computer telephony and instant messaging. Erlang's runtime system has built-in support for concurrency, distribution and fault tolerance.

_Note: This feature does not install the build tools or dependencies needed for successfully compiling your version of Erlang and the BEAM. You need to install them separately beforehand. See [apt-get-packages](../apt-get-packages/) for an example of how to do this and the [asdf-erlang](https://github.com/asdf-vm/asdf-erlang?tab=readme-ov-file#before-asdf-install) plugin page for the build dependencies needed for your version of Erlang._

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/erlang-asdf:1": {
        "version": "28.1",
        "kerlConfigureOptions": "--disable-debug --without-javac"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| kerlConfigureOptions | kerl configure options used when building. | string | --disable-debug --without-javac |

