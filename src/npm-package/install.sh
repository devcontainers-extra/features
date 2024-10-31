#!/usr/bin/env bash
set -e

PACKAGE=${PACKAGE:-""}
VERSION=${VERSION:-"latest"}

# Clean up
rm -rf /var/lib/apt/lists/*

if [ -z "$PACKAGE" ]; then
	echo -e "'package' variable is empty, skipping"
	exit 0
fi

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as
    root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

check_packages() {
	# This is part of devcontainers-extra script library
	# source: https://github.com/devcontainers-extra/features/tree/v1.1.8/script-library
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

install_via_npm() {
	# This is part of devcontainers-extra script library
	# source: https://github.com/devcontainers-extra/features/tree/v1.1.8/script-library
	PACKAGE=$1

	# install node+npm if does not exists
	if ! type npm >/dev/null 2>&1; then
		echo "Installing node and npm..."
		check_packages curl ca-certificates
		curl -fsSL https://raw.githubusercontent.com/devcontainers/features/main/src/node/install.sh | VERSION="lts" bash
		export NVM_DIR=/usr/local/share/nvm
		[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
		[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
	fi

	if [ "$VERSION" = "latest" ]; then
		npm_installation="$PACKAGE"
	else
		npm_installation="${PACKAGE}@${VERSION}"
	fi

	if [ "$(npm list --global --depth 0 --omit dev | grep "$npm_installation")" != "" ]; then
		echo "$PACKAGE  already exists - skipping installation"
		exit 0
	fi



	npm install -g --omit=dev "$npm_installation"
}

install_via_npm "$PACKAGE" "$VERSION"
