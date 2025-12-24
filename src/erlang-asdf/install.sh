#!/usr/bin/env bash
set -ex

# ------------------------------------------------------------------------------
# Erlang (via asdf) – devcontainer feature
# ------------------------------------------------------------------------------

# Provided by devcontainer feature runtime
REMOTE_USER="${_REMOTE_USER:-vscode}"
REMOTE_USER_HOME="${_REMOTE_USER_HOME:-/home/$REMOTE_USER}"

# Feature options (auto-exported by devcontainers)
VERSION="${VERSION:-latest}"
KERLCONFIGUREOPTIONS="${KERLCONFIGUREOPTIONS:-}"

# asdf locations
ASDF_DIR="${ASDF_DIR:-$REMOTE_USER_HOME/.asdf}"
KERL_HOME="$ASDF_DIR/plugins/erlang/kerl-home"
KERLRC_PATH="$KERL_HOME/.kerlrc"

echo "[erlang-asdf] Remote user: $REMOTE_USER"
echo "[erlang-asdf] Remote home: $REMOTE_USER_HOME"
echo "[erlang-asdf] asdf dir:     $ASDF_DIR"

# ------------------------------------------------------------------------------
# Ensure required base packages (curl/git/ca-certificates)
# ------------------------------------------------------------------------------

if grep -qiE 'alpine' /etc/os-release; then
  apk add --no-cache curl git ca-certificates
else
  apt-get update -y
  apt-get install -y --no-install-recommends curl git ca-certificates
  rm -rf /var/lib/apt/lists/*
fi

# ------------------------------------------------------------------------------
# Install asdf for the remote user if missing
# ------------------------------------------------------------------------------

if ! su - "$REMOTE_USER" -c "command -v asdf >/dev/null 2>&1"; then
  echo "[erlang-asdf] Installing asdf for $REMOTE_USER"
  su - "$REMOTE_USER" <<EOF
    set -e
    git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.12.0
EOF
fi

# Ensure asdf is sourced in login shells
ASDF_INIT_LINE=". \"$ASDF_DIR/asdf.sh\""
for rc in /etc/profile /etc/bash.bashrc; do
  if [ -f "$rc" ] && ! grep -q "$ASDF_INIT_LINE" "$rc"; then
    echo "$ASDF_INIT_LINE" >> "$rc"
  fi
done

# ------------------------------------------------------------------------------
# Write kerl configuration (THE KEY PART)
# ------------------------------------------------------------------------------

if [ -n "$KERLCONFIGUREOPTIONS" ]; then
  echo "[erlang-asdf] Writing kerl config to $KERLRC_PATH"
  mkdir -p "$KERL_HOME"
  printf 'KERL_CONFIGURE_OPTIONS="%s"\n' "$KERLCONFIGUREOPTIONS" > "$KERLRC_PATH"
  chown -R "$REMOTE_USER:$REMOTE_USER" "$KERL_HOME"
else
  echo "[erlang-asdf] No kerl options provided"
fi

# ------------------------------------------------------------------------------
# Install Erlang via asdf (same execution context as kerl)
# ------------------------------------------------------------------------------

echo "[erlang-asdf] Installing Erlang $VERSION"

su - "$REMOTE_USER" <<EOF
  set -e
  . "$ASDF_DIR/asdf.sh"

  if ! asdf plugin list | grep -q '^erlang$'; then
    asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
  fi

  if [ "$VERSION" = "latest" ]; then
    RESOLVED_VERSION="\$(asdf latest erlang)"
  else
    RESOLVED_VERSION="$VERSION"
  fi

  echo "[erlang-asdf] Resolved Erlang version: \$RESOLVED_VERSION"

  asdf install erlang "\$RESOLVED_VERSION"
  asdf global erlang "\$RESOLVED_VERSION"
EOF

echo "[erlang-asdf] Done"
