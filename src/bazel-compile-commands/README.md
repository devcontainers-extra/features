# bazel-compile-commands (via Github Releases) (bazel-compile-commands)

Generates `compile_commands.json` from Bazel builds, enabling accurate code intelligence (go-to-definition, cross-references, diagnostics) in editors that support the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/).

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/bazel-compile-commands:1": {}
}
```

## Options

| Options Id | Description                                                                                                                      | Type   | Default Value |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------- | ------ | ------------- |
| version    | Version to install. Accepts `latest`, a numeric version like `0.22.4`, or the full release tag `bazel-compile-commands-v0.22.4`. | string | latest        |

## Install behaviour

The feature selects the best available package for the current environment:

| Environment          | Package used                    |
| -------------------- | ------------------------------- |
| Ubuntu Noble (24.04) | Native `.deb` via `apt-get`     |
| Other Linux          | Generic `.zip` (amd64 or arm64) |
| macOS                | Universal `.zip`                |

## Pairing with Bazel

This feature pairs naturally with [`ghcr.io/devcontainers-community/features/bazel:1`](https://github.com/devcontainers-community/features-bazel), which installs Bazelisk and Buildifier. When both are present in `devcontainer.json`, the Bazel feature is installed first.

```json
"features": {
    "ghcr.io/devcontainers-community/features/bazel:1": {},
    "ghcr.io/devcontainers-extra/features/bazel-compile-commands:1": {}
}
```

---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json). Add additional notes to a `NOTES.md`._
