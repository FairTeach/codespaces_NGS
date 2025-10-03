#!/usr/bin/env bash
set -euo pipefail

log() {
  echo ">>> $*"
}

# Install Chromium so the noVNC desktop has a modern browser available
ensure_chromium() {
  if command -v chromium-browser >/dev/null 2>&1 || command -v chromium >/dev/null 2>&1; then
    log "Chromium already installed; skipping."
    return
  fi

  if ! command -v sudo >/dev/null 2>&1; then
    log "sudo not available; cannot install Chromium automatically."
    return
  fi

  if ! command -v apt-get >/dev/null 2>&1; then
    log "apt-get not available; skipping Chromium install."
    return
  fi

  log "Installing Chromium browser for the desktop environment..."
  sudo apt-get update
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common gnupg

  if ! grep -Rqs "apandada1.*chromium" /etc/apt/sources.list /etc/apt/sources.list.d 2>/dev/null; then
    log "Adding Chromium PPA (ppa:apandada1/chromium)..."
    sudo add-apt-repository -y ppa:apandada1/chromium
  fi

  sudo apt-get update
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y chromium-browser
  sudo rm -rf /var/lib/apt/lists/*

  if command -v chromium-browser >/dev/null 2>&1 && [ ! -e /usr/bin/chromium ]; then
    log "Linking /usr/bin/chromium to chromium-browser for convenience..."
    sudo ln -s /usr/bin/chromium-browser /usr/bin/chromium
  fi
}

ensure_chromium

log "Ensuring conda is initialized for bash..."
conda init bash || true

log "Post-create complete."
