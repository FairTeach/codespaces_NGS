---
title: "Intro into GitHub Codespaces"
author: "Igor Ruiz de los Mozos PhD"
output:
  html_document: default
  pdf_document: default
  date: 2025
---

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/FairTeach/codespaces_NGS?quickstart=1)

<a href="https://github.com/codespaces">
  <img
    src="https://img.shields.io/badge/Explore-GitHub%20Codespaces-181717?logo=github"
    alt="GitHub Codespaces"
  />
</a>

# Introduction to the Codespaces environment

This guide explains how to launch and operate the desktop-enabled Codespace that powers the NGS practicals. It replaces the legacy Gitpod instructions used in previous years.

## Launching the Codespace

1. Visit the repository at [FairTeach/codespaces_NGS](https://github.com/FairTeach/codespaces_NGS).
2. Select `<> Code` → `Create codespace on main` (or reuse an existing Codespace from the Codespaces dashboard).
3. Wait for the dev container build to complete. The process provisions Xfce, TigerVNC/noVNC, Miniforge+mamba, IGV desktop, and course-specific tooling.
4. Once VS Code connects, the desktop services start automatically under Supervisor. No additional setup is required.

> **Tip:** Reopen an existing Codespace for subsequent sessions to keep intermediate files. Starting a fresh Codespace restores the repository to its committed state.

## Accessing the remote desktop

1. Open the **Ports** panel and locate port `6080` labelled `Desktop (noVNC)`.
2. Click the globe icon to open the noVNC session in a new browser tab.
3. Enter the VNC password `vscode` when prompted.
4. Inside Xfce, use `Applications → Terminal Emulator` for GUI-based terminal work, or continue running commands from the VS Code terminal.

To confirm the desktop is responsive, launch `xeyes` or `xclock` from the terminal and verify the window appears.

## Working with conda/mamba

- `mamba` is preinstalled; run `which mamba` or `mamba --version` to verify.
- Shells automatically source Miniforge (`/opt/miniforge/etc/profile.d/conda.sh`), so the base environment is active whenever you open a new terminal.
- Install extra packages with `mamba install -y <package>` (for example, `mamba install -y samtools`) and confirm with the corresponding `--version` command.

## Running IGV and IGV-Web

- Launch IGV desktop from any terminal with `igv &`; the application opens inside the noVNC desktop.
- Load data via `File → Load Genome from Server` or by browsing to files stored in the workspace.
- A lightweight IGV-Web demo is available under `/opt/igv-web`. Start it with `python3 -m http.server 8000` from that directory, then open the forwarded port `8000` in your browser.

## Serving HTML reports

- From any project folder, run `python3 -m http.server 8000` to preview static reports inside the desktop or via port forwarding.
- VS Code's Markdown/Notebook preview remains available for quick checks without leaving the editor.

## Troubleshooting

- Check supervised services with `sudo supervisorctl status`. If needed, restart them using `sudo supervisorctl restart desktop`.
- Run `.devcontainer/scripts/healthcheck.sh` to confirm `mamba`, TigerVNC, and noVNC are healthy.
- If a Codespace becomes unstable, stop it from the Codespaces dashboard and create a new one; the build is reproducible and replays the provisioning steps automatically.

---

For the complete repository overview and module links, see the root `README.md`.
