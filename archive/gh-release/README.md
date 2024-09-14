
# Github Release (gh-release)

Github Release feature will download, extract and add to path a release binary from a given repo

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/gh-release:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| repo | Select the version of the github release binary to install. | string | - |
| binaryNames | The target binary name (Comma separated in case there are multiple binaries in the same asset). For example, for Github CLI the binary name would be simply 'gh'. For DigitalOcean CLI: 'doctl'. For etcd it would be two: 'etcd,etcdctl' | string | - |
| version | Select the version of the github release binary to install. | string | latest |
| assetRegex | An optional filtering regex to help point the correct release asset. | string | - |
| releaseTagRegex | An optional filtering regex to help point the correct release git tag. | string | - |
| binLocation | Location to download the target binary to. Typically a location which exist under PATH variable | string | /usr/local/bin |
| libName | Name for the lib dir (if exists). Will default to binary name if not given | string | - |
| libLocation | Any lib files (if exists) will be downloaded into this location. The binary will then be soft linked from the lib location to the bin location | string | /usr/local/lib |
| additionalFlags | (Optional) Any additional flags for the 'nanolayer install gh-release' command  | string | - |


