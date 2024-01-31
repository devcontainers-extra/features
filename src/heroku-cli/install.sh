#!/usr/bin/env bash
# This is a modified version of heroku official script (https://cli-assets.heroku.com/install.sh)
# Differences:
# 1. Allows to choose any version
# 2. Assumes linux os only (dev containers oriented)
# 3. Installs curl if not available

HEROKU_CLI_VERSION="${VERSION:-"latest"}"

set -e

if [ "$(id -u)" -ne 0 ]; then
	echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
	exit 1
fi

# Clean up
rm -rf /var/lib/apt/lists/*

ARCH="$(uname -m)"
if [ "$ARCH" == "x86_64" ]; then
	ARCH=x64
elif [[ "$ARCH" == aarch* ]]; then
	ARCH=arm
else
	echo -e "unsupported arch: $ARCH"
	exit 1
fi

# Checks if packages are installed and installs them if not
check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

# make sure we have curl
check_packages ca-certificates curl

# make sure /usr/local/lib exists
mkdir -p /usr/local/lib

# remove existing instalations
rm -rf /usr/local/lib/heroku
rm -rf ~/.local/share/heroku/client
rm -f $(command -v heroku) || true
rm -f /usr/local/bin/heroku

# resolve download url based on version, this is not documented and prune to break if heroku change their naming convensions
if [ "${HEROKU_CLI_VERSION}" == "latest" ]; then
	DOWNLOAD_URL=https://cli-assets.heroku.com/channels/stable/heroku-linux-$ARCH.tar.gz
else
	DOWNLOAD_URL=https://cli-assets.heroku.com/heroku-v${HEROKU_CLI_VERSION}/heroku-v${HEROKU_CLI_VERSION}-linux-${ARCH}.tar.gz
fi

# download binary, untar and ln into /usr/local/bin
curl -sSL $DOWNLOAD_URL | tar xz -C /usr/local/lib
chmod +x /usr/local/lib/heroku/bin/heroku
ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
