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

GitHub Codespaces provides a fully managed, cloud-hosted development environment that mirrors the tooling we use in class. By default, verified GitHub Global Campus students receive up to **180 core-hours per month** (for example, 90 hours on a 2-core machine) and **32 GB of storage** across active codespaces—plenty for this module’s workloads. If you ever need more, you can adjust machine sizes or delete unused spaces from the [Codespaces dashboard](https://github.com/codespaces).

To deepen your understanding of Codespaces, explore these resources:
- [Codespaces documentation home](https://docs.github.com/en/codespaces)
- [Quickstart: Use GitHub Codespaces for the first time](https://docs.github.com/en/codespaces/getting-started/quickstart)
- [Codespaces video walkthroughs](https://resources.github.com/webcasts/topics/codespaces/)
- [Developing in Codespaces guide](https://docs.github.com/en/codespaces/developing-in-codespaces)

## Launching the Codespace from GitHub Web

1. Visit the repository at [FairTeach/codespaces_NGS](https://github.com/FairTeach/codespaces_NGS).
2. Select `<> Code` → `Create codespace on main` (or reuse an existing Codespace from the Codespaces dashboard).
3. Wait for the dev container build to complete. The process provisions Xfce, TigerVNC/noVNC, Miniforge+mamba, IGV desktop, and course-specific tooling.
4. Once VS Code connects, the desktop services start automatically under Supervisor. No additional setup is required.

> **Tip:** Reopen an existing Codespace for subsequent sessions to keep intermediate files. Starting a fresh Codespace restores the repository to its committed state.

This classes has been designed to run inside Gitpod cloud environment. To start it, just press the following button:
  
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/FairTeach/codespaces_NGS?quickstart=1)
    
You will be redirected to a pop up window, were you require to log in GitHub. After a successful logging, you will be redirected to Gitpod cloud environment. Select the VSCode IDE the Standard machine and continue. 
   
![ Select IDE and machine ](figures/createCodespaces.png)
    
The workspace will install and deployed all the requirements to perform the following practical. To launch a Desktop GUI **Open Browser** `A service is available on port 6080` to open another tab with a visual Desktop that will allow you to navigate visually this computer.

  
Then click on `Main Terminal` to open a command line *bash* interpreter, were you could run the commands explained in this practical.

![ Open Main Terminal ](figures/terminal.png)

On the left hand side, you will find a `File Explorer` to interact will all the files from this repository. 

![ File Explorer ](figures/file_explorer.png)

Right click `GenomeComparisionPractical.md` and select **Open Preview**, to display this practical on the file editor section.  

![ Preview Practical ](figures/open_md.png)

Next time that you want to open this practical, you don´t need to start a new workspace. Just point to [ GitHub Codespaces](https://github.com/codespaces)  were your previous sessions will be hosted with all the intermediate files produced **TIP   Keep this URL on your WebBrowser Bookmarks**.  Note that if you continue previous workspaces intermediate files will be there, but if you start a new workspace it will be empty (just the initial files proposed)
 

    
## Accessing the remote desktop

1. Open the **Ports** panel and locate port `6080` labelled `Desktop (noVNC)`.
2. Click the globe icon to open the noVNC session in a new browser tab.
3. Enter the VNC password `vscode` when prompted.

## Working with conda/mamba

- `mamba` is preinstalled; run `which mamba` or `mamba --version` to verify.
- Shells automatically source Miniforge (`/opt/miniforge/etc/profile.d/conda.sh`), so the base environment is active whenever you open a new terminal.
- Install extra packages with `mamba install -y <package>` (for example, `mamba install -y samtools`) and confirm with the corresponding `--version` command.

## Running IGV 

- Launch IGV desktop from any terminal with `igv &`; the application opens inside the noVNC desktop.
- Load data via `File → Load Genome from Server` or by browsing to files stored in the workspace.



---

For the complete repository overview and module links, see the root `README.md`.

This button will be on every tutorial to allow you to return to your previous workspace and keep your files.
[![GitHub Codespaces](https://img.shields.io/badge/GitHub-Codespaces-181717?logo=github)](https://github.com/codespaces)
