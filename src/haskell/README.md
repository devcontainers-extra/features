
# Haskell (via ghcup) (haskell)

Installs Haskell. An advanced, purely functional programming language

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/haskell:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| ghcVersion | Select the GHC (Glasgow Haskell Compiler) version to install. | string | recommended |
| cabalVersion | Select the Cabal (a system for building and packaging Haskell libraries and programs) version to install. | string | recommended |
| globalPackages | Packages to install via `cabal install`, such as `hlint` for linting. Separate with spaces. This will add significant initial build time. | string | - |
| installHLS | Install HLS, the Haskell Language Server. | boolean | true |
| downgradeGhcToSupportHls | This will downgrade GHC to the closest version supported by HLS. There is often a gap between a GHC release and tooling support. | boolean | true |
| installStack | Install Stack, a build tool for Haskell. | boolean | true |
| installStackGHCupHook | Enabling this means that stack won't install its own GHC versions, but uses GHCup's | boolean | true |
| adjustBash | whether to adjust PATH in bashrc (prepend) | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
