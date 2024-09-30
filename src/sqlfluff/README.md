
# SqlFluff (via pipx) (sqlfluff)

Fluff is an extensible and modular linter designed to help you write good SQL and catch errors and bad SQL before it hits your database.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/sqlfluff:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| plugins | A space delimitered list of sqlfluff plugins (will be injected into the sqlfluff pipx env). See proposals for examples. | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
