
# Meltano ELT (via pipx) (meltano)

Meltano lets you extract and load data with a software development-inspired approach that that delivers flexibility and limitless collaboration.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/meltano:2": {
        "version": "latest",
        "pythonVersion": "3.12",
        "extras": "s3,postgres"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Meltano ELT to install. | string | latest |
| pythonVersion | Select the version of Python to use. | string | 3.11 |
| extras | Comma-delimited list of Meltano extras to install. | string | "" |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
