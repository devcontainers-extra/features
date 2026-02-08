# Additional Notes

- Bun Website: [https://bun.com/](https://bun.com/)
- Bun GitHub: [https://github.com/oven-sh/bun](https://github.com/oven-sh/bun)

## Install Method

This feature installs Bun via the repository's `gh-release` helper, which downloads the correct release asset for the current platform and architecture and places the `bun` binary in `/usr/local/bin`. This follows the repo’s best practices for reproducibility and small image layers.

## bunx shim

Bun supports executing binaries with `bun x <pkg>`. Some environments/tools expect a `bunx` executable. To provide a consistent experience, this feature adds a small shim at `/usr/local/bin/bunx` that forwards to `bun x`. If the upstream release reliably includes a `bunx` binary in the future, the shim can be removed without breaking users.

## Usage Examples

Default (latest):

```json
"features": {
  "ghcr.io/devcontainers-extra/features/bun:1": {}
}
```

Pin a specific version:

```json
"features": {
  "ghcr.io/devcontainers-extra/features/bun:1": {
    "version": "1.1.38"
  }
}
```

## Support

- Distros: `Debian` / `Ubuntu` and `Alpine`
- Architectures: `x86_64` and `arm64` (based on available Bun releases)

## Tests

This feature is tested against various Distros:

- `Ubuntu` (glibc)
- `Debian` (glibc)
- `Alpine` (musl)
- `Debian` with a pinned version of Bun

*Note: Only architectures with actual Bun release assets are supported (x86_64 and arm64).* *

## Architecture and Asset Selection

This feature automatically selects the correct Bun release asset based on the detected architecture and libc:

- **x86_64**: Uses "baseline" builds for optimal CPU compatibility (e.g., `bun-linux-x64-baseline.zip`)
- **arm64**: Uses standard builds since "baseline" variants are not published for ARM64 (e.g., `bun-linux-aarch64.zip`)

The installation includes robust fallback logic:

- Primary: Preferred asset pattern for the detected architecture/libc combination
- Fallback: Alternative patterns if the primary asset is not found
- Error handling: Clear error messages if no suitable asset is available

This approach ensures compatibility across different platforms while gracefully handling potential future changes to Bun's release asset naming.

## Considerations / Future Enhancements

- Coexistence with Node.js: this feature only installs `bun` and a `bunx` shim and does not modify Node.js.
- PATH/profile: installation to `/usr/local/bin` avoids profile changes.
- Asset regex patterns: the fallback chain ensures compatibility even if Bun changes their release asset naming conventions.

## Debugging

- To enable additional debug logs during installation, set the environment variable `BUN_FEATURE_DEBUG=1`.
- Diagnostic logs from detection functions are emitted to stderr to keep return values clean.
