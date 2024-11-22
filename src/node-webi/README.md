
# Node.js via webi (node-webi)

Installs Node.js and npm using webi, with options to specify the version and install global npm packages.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/node-webi:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Node.js version to install (e.g., '18', '20', or 'lts'). | string | lts |
| packages | Comma-separated list of npm packages to install globally. | string | - |
