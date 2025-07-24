
# jsonnet (via GitHub Releases) (jsonnet)

Install jsonnet and associated tools

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/jsonnet:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Jsonnet to install. | string | latest |
| installJsonnetBundler | Install jsonnet-bundler, a package manager for Jsonnet. | boolean | false |
| jsonnetBundlerVersion | Select the version of jsonnet-bundler to install. | string | latest |

## Customizations

### VS Code Extensions

- `Grafana.vscode-jsonnet`

## Installed binaries

- `jsonnet`: Jsonnet interpreter (Go implementation)
- `jsonnet-deps`: Jsonnet static dependency parser
- `jsonnetfmt`: Jsonnet formatter
- `jsonnet-lint`: Jsonnet linter
- _(Optional)_ `jb`: jsonner-bundler, a Jsonnet package manager

---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
