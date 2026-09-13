# valkey (via build from source) (valkey)

Valkey is an open source (BSD) high performance key/value datastore. Installs valkey-server and valkey-cli by building from source, following the official valkey-container Dockerfile.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/valkey:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install (full version tag, e.g. 8.1.10, or 'latest'). | string | latest |

## Starting the Server

This feature only installs the binaries; it does not start a daemon. To start `valkey-server` automatically each time the container starts, add a `postStartCommand` to your `devcontainer.json`:

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:debian",
    "features": {
        "ghcr.io/devcontainers-extra/features/valkey:1": {}
    },
    "postStartCommand": "valkey-server --daemonize yes"
}
```

`--daemonize yes` backgrounds the server (it would otherwise block the postStartCommand). Connect with `valkey-cli` or `valkey-cli ping`.

## Notes

- Valkey does not publish prebuilt binaries, only source tarballs, so this feature compiles from source, mirroring the [official valkey-container Dockerfile](https://github.com/valkey-io/valkey-container/blob/mainline/Dockerfile.template).
- The downloaded tarball is verified against the [official valkey-hashes file](https://github.com/valkey-io/valkey-hashes).
- TLS support is enabled (`BUILD_TLS=yes`).
- Start the server manually with `valkey-server` and connect with `valkey-cli`.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._