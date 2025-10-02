#!/usr/bin/env bash
set -euo pipefail

# Ensure Firefox is available for desktop HTML viewing
if command -v apt-get >/dev/null 2>&1; then
  echo ">>> Installing Firefox for desktop environment..."
  sudo apt-get update
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y firefox
  sudo rm -rf /var/lib/apt/lists/*
fi

echo ">>> Initializing conda in this shell..."
if ! command -v conda >/dev/null 2>&1; then
  source /etc/profile.d/conda.sh 2>/dev/null || true
  eval "$(/usr/local/bin/conda shell.bash hook)" 2>/dev/null || true
  eval "$(/opt/conda/bin/conda shell.bash hook)" 2>/dev/null || true
fi

echo ">>> Configuring conda channels..."
# Wipe existing config and set new priorities
conda config --remove-key channels || true
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

echo ">>> Installing mamba into base env..."
conda install -y -n base -c conda-forge mamba
# conda install -y -n base multiqc

# Install MultiQC using mamba if available
# MAMBA_BIN="$(conda info --base)/bin/mamba"
# if [ -x "$MAMBA_BIN" ]; then
#   echo ">>> Installing MultiQC into base env with mamba..."
#   "$MAMBA_BIN" install -y -n base multiqc
# else
#   echo ">>> mamba not found on PATH; falling back to conda for MultiQC..."
#   conda install -y -n base -c bioconda multiqc
# fi

echo ">>> Ensuring conda is initialized for bash..."
conda init bash || true

echo ">>> Post-create complete."
