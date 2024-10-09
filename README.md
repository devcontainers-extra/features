# Extra Dev Container Features

🐳 Extra add-in features for
[devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) and
[GitHub Codespaces](https://github.com/features/codespaces)

👀 Don't see your feature here? [🔥 Suggest a new feature! 🔥](https://github.com/devcontainers-extra/features/issues/new?template=suggest-feature.yaml) \
🔍 Found a bug? [🐞 Open a bug report! 🐞](https://github.com/devcontainers-extra/features/issues/new?template=feature-bug-report.yaml)

## About This Fork

This repository is a continuation of the [devcontainers-contrib/features](https://github.com/devcontainers-contrib/features) project, initially developed by [danielbraun89](https://github.com/danielbraun89). The fork was created to maintain and enhance the project due to inactivity in the original repository.

> [!NOTE]
> This project is not officially associated with or endorsed by the official [Devcontainers](https://containers.dev/) project

## Usage

Just add a `.devcontainer/devcontainer.json` file with a `features` key. It's
very similar to `package.json`'s `dependencies` object, just with the addition
of an `options` object.

📚 Make sure to inspect each feature for feature-specific options!

```json
{
  "image": "mcr.microsoft.com/devcontainers/base:bookworm",
  "features": {
    "ghcr.io/devcontainers-extra/features/deno": {},
    "ghcr.io/devcontainers-extra/features/neovim": {}
  }
}
```

Then, after adding your devcontainer config file, you can open it in GitHub
Codespaces, or \[open it locally using VS Code\]. Be warned some features will
compile things from source code and may take a while!

<div align="center">

![](https://i.imgur.com/JMdowst.png)

</div>
