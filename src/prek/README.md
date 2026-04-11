# prek (via Github Releases)

prek is a faster, dependency-free alternative to pre-commit, re-engineered in Rust.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/prek:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |

## About prek

[prek](https://github.com/j178/prek) is a reimagined version of pre-commit, built in Rust. It is designed to be a faster, dependency-free and drop-in alternative, while also providing some additional long-requested features.

### Key Features

- A single binary with no dependencies, does not require Python or any other runtime
- Multiple times faster than `pre-commit` and takes up half the disk space
- Fully compatible with the original pre-commit configurations and hooks
- Built-in support for monorepos (workspace mode)
- Integration with uv for managing Python virtual environments and dependencies
- Built-in Rust-native implementation of some common hooks

## Installation

This feature installs prek from GitHub releases based on your system architecture (x86_64 or aarch64) and C library type (glibc or musl).

---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json)._
