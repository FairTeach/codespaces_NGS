#!/usr/bin/env bash
set -euo pipefail

log() {
  echo ">>> $*"
}

# Install Chromium so the noVNC desktop has a modern browser available
# ensure_chromium() {
#   if command -v chromium-browser >/dev/null 2>&1 || command -v chromium >/dev/null 2>&1; then
#     log "Chromium already installed; skipping."
#     return
#   fi

#   if ! command -v sudo >/dev/null 2>&1; then
#     log "sudo not available; cannot install Chromium automatically."
#     return
#   fi

#   if ! command -v apt-get >/dev/null 2>&1; then
#     log "apt-get not available; skipping Chromium install."
#     return
#   fi

#   log "Installing Chromium browser for the desktop environment..."
#   sudo apt-get update
#   sudo DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common curl wget gnupg

#   if sudo DEBIAN_FRONTEND=noninteractive apt-get install -y chromium-browser chromium 2>/tmp/chromium-apt.log; then
#     log "Chromium installed via Ubuntu repositories."
#   else
#     log "Chromium packages unavailable in default repos; attempting ungoogled-chromium PPA."
#     sudo rm -f /tmp/chromium-apt.log

#     sudo install -d -m 0755 /etc/apt/keyrings
#     if [ ! -f /etc/apt/keyrings/ungoogled-chromium.gpg ]; then
#       log "Fetching signing key for ungoogled-chromium..."
#       if command -v curl >/dev/null 2>&1; then
#         curl -fsSL https://ppa.launchpadcontent.net/ungoogled-chromium/ungoogled-chromium/ubuntu/KEY.gpg | \
#           sudo gpg --dearmor -o /etc/apt/keyrings/ungoogled-chromium.gpg
#       else
#         wget -qO- https://ppa.launchpadcontent.net/ungoogled-chromium/ungoogled-chromium/ubuntu/KEY.gpg | \
#           sudo gpg --dearmor -o /etc/apt/keyrings/ungoogled-chromium.gpg
#       fi
#     fi

#     if [ ! -f /etc/apt/sources.list.d/ungoogled-chromium.list ]; then
#       log "Adding ungoogled-chromium apt source..."
#       echo "deb [signed-by=/etc/apt/keyrings/ungoogled-chromium.gpg] https://ppa.launchpadcontent.net/ungoogled-chromium/ungoogled-chromium/ubuntu jammy main" | \
#         sudo tee /etc/apt/sources.list.d/ungoogled-chromium.list >/dev/null
#     fi

#     sudo apt-get update
#     sudo DEBIAN_FRONTEND=noninteractive apt-get install -y ungoogled-chromium
#     if [ ! -e /usr/bin/chromium ] && command -v ungoogled-chromium >/dev/null 2>&1; then
#       log "Linking /usr/bin/chromium to ungoogled-chromium for compatibility..."
#       sudo ln -s /usr/bin/ungoogled-chromium /usr/bin/chromium
#     fi
#   fi

#   sudo rm -rf /var/lib/apt/lists/*
# }



log "Ensuring conda is initialized for bash..."
conda init bash || true

log "Post-create complete."
