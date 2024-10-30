# Contributing to devcontainers-extra/features

Thank you for considering contributing to the devcontainers-extra/features repository! We appreciate your time and effort in helping us improve this project. Below are the guidelines for contributing new features to the repository.

## Adding a New Feature

1. **Fork the Repository**: Start by forking the repository.

2. **Add Boilerplate**: Run `just add your-feature` to add boilerplate for your feature in `src` and `test`.

3. **Install Feature**: Modify `src/your-feature/install.sh` to install the feature. Some helpers are available for common install methods
    * [ghcr.io/devcontainers-extra/features/gh-release](https://github.com/devcontainers-extra/features/blob/main/src/gh-release/README.md) for GitHub Releases
    * [ghcr.io/devcontainers-extra/features/pipx-package](https://github.com/devcontainers-extra/features/blob/main/src/pipx-package/README.md) for Python packages via pipx

4. **Update Metadata**: In `src/your-feature/devcontainer-feature.json`
    * Replace `<installation-method>`  with the feature's install method, like `GitHub Releases`
    * Provide a short description of the feature
    * Provide a default version, or use the latest version
    * Add the image names of any helpers to `installsAfter`

5. **Add README**: Add a `src/your-feature/README.md` file with information about your new feature. It may help to copy a README from an existing feature. Include usage instructions, arguments, and any relevant details.

6. **Update Tests**: Replace `x.y.z` in `test/your-feature/scenarios.json` with the latest version of the feature. Then modify `test_specific_version.sh` to check for that version, and `test.sh` to check for any version.

7. **Test Your Changes**: Visit the Actions tab in your fork, and enable Actions. Then commit and push your changes, and ensure the tests pass.

8. **Create a Pull Request**: Create a pull request to the main repository. Provide a detailed description of your changes and any additional information that may be helpful for the review process.

## Using `just` Commands

The repository contains a `justfile` with commands for testing and adding features. Here are some useful `just` commands:

* `just test <feature-name>`: Test a specific feature.
* `just test-scenario <feature-name> <scenario-filter>`: Test a specific feature with a scenario filter.
* `just unarchive <feature-name>`: Unarchive a feature from the `archive` directory.
* `just add <feature-name>`: Add a new feature using the templates in the `templates` directory.

## Additional Information

* **Code Style**: Follow the existing code style and conventions used in the repository.
* **Documentation**: Ensure that your feature is well-documented, including usage instructions and any relevant details.
* **Testing**: Thoroughly test your feature to ensure it works as expected and does not introduce any issues.

## Using the `pipx-package` Helper

The `pipx-package` helper is a convenient way to install Python packages via pipx. It simplifies the installation process and ensures that the packages are installed in isolated environments.

To use the `pipx-package` helper, follow these steps:

1. **Add the Helper to Your Feature**: In your `devcontainer-feature.json` file, add the `pipx-package` helper to the `installsAfter` array. For example:

    ```json
    "installsAfter": [
        "ghcr.io/devcontainers-extra/features/pipx-package",
        "ghcr.io/devcontainers/features/python"
    ]
    ```

2. **Modify the Install Script**: In your `install.sh` script, use the `pipx-package` helper to install the desired Python package. For example:

    ```bash
    $nanolayer_location \
        install \
        devcontainer-feature \
        "ghcr.io/devcontainers-extra/features/pipx-package:1.1.8" \
        --option package='your-package' --option version="$VERSION"
    ```

3. **Test the Installation**: Ensure that the package is installed correctly by running the appropriate tests.

Thank you for your contribution! If you have any questions or need further assistance, feel free to open an issue or reach out to the maintainers.
