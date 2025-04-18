# Claude YOLO (via npm)

Claude YOLO enables visual object detection capabilities with Claude in the command line. It works with the Claude Code CLI to provide AI-powered object detection.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-extra/features/claude-code:1": {},
    "ghcr.io/devcontainers-extra/features/claude-yolo:1": {
        "version": "latest"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | "latest" |

## Requirements

- This feature requires the Claude Code CLI to be installed first
- Node.js is required for installation

## Customizations

### VS Code Extensions

- `anthropic.claude-vscode`: Claude for VS Code - The official extension for using Claude in VS Code

## License

MIT

## References

- [Claude Code documentation](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview)