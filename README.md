---
title: "Intro into Gitpod"
author: "Igor Ruiz de los Mozos PhD"
output:
  html_document: default
  pdf_document: default
  date: 2025
---

    
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/FairTeach/NGS_practicals?quickstart=1)

> **New 2025 workflow:** This repository now targets GitHub Codespaces with an Ubuntu-based dev container that ships Xfce, TigerVNC/noVNC, Miniforge+mamba, and IGV desktop ready to use.
<!--- cSpell:enable --->


## Codespaces Desktop Environment

1. Open the repository in **GitHub Codespaces** (use the button above or Codespaces > New with this repo).
2. Wait for the dev container build to finish; it installs Miniforge+mamba, IGV, Xfce, TigerVNC, noVNC, Supervisor, and supporting CLI tools.
3. When VS Code connects the desktop stack starts automatically. If you need to restart it later run `sudo supervisorctl restart desktop`.

### Using the remote desktop
- In the **Ports** tab open port `6080` (label `noVNC Desktop`). When prompted, use VNC password `codespaces` to reach the Xfce session.
- Launch `Applications -> Terminal Emulator` inside Xfce for GUI workflows, or keep using the VS Code terminal for CLI commands.
- To verify X11 rendering, run `xeyes` or `xclock` from the desktop terminal and confirm the window appears.

### Conda / mamba
- `mamba` is available globally. Check with `which mamba` and `mamba --version`.
- Login shells source `/opt/miniforge/etc/profile.d/conda.sh` automatically; the base environment activates on every terminal.
- Install extra tools with `mamba install -y samtools` (example) and confirm with `samtools --version`.

### IGV desktop and IGV-Web
- Start IGV from any terminal with `igv &`; it launches inside the desktop session. Hardware acceleration is not available in Codespaces, so IGV uses software rendering.
- Load reference genomes via `File -> Load Genome from Server` or add data stored in the workspace.
- A lightweight IGV-Web demo is stored under `/opt/igv-web`. Serve it with `python3 -m http.server 8000` from that directory and open forwarded port `8000` (label `Local HTML Server`).

### Serving HTML reports
- From any project folder, run `python3 -m http.server 8000` and open the forwarded port in your browser or inside the desktop to preview static reports.
- For notebook previews you can keep using VS Code built-ins, or export HTML and open it in the desktop browser.

### Troubleshooting and health checks
- Check service status with `sudo supervisorctl status`.
- Run `.devcontainer/scripts/healthcheck.sh` to verify `mamba`, TigerVNC, and noVNC are healthy.
- Rebuilds are idempotent. If a Codespace becomes unhealthy, stop it and create a fresh one; no manual reconfiguration is required.

### Differences vs. the legacy Gitpod setup
- Replaces Gitpod's `workspace-full-vnc` base image with a slimmer Ubuntu base tuned for Codespaces.
- Miniforge + mamba are preinstalled and activated automatically; no post-start Gitpod tasks are required.
- Supervisor keeps TigerVNC and noVNC running in the background and exposes them via Codespaces port forwarding (password `codespaces`).
- IGV desktop and an optional IGV-Web demo ship with the image; desktop apps run via noVNC and CLI tools via VS Code terminals.
- Gitpod-specific startup tasks and VNC helpers have been removed in favor of reproducible container build steps.

## Requirements  
       
This document was written to help students enrolled. First of all, you will need to obtain a GitHub Education account to workout these classes. A part of the access to GitHub itself, you will get a bunch of professional software that will improve your code learning GitHub Education [ GitHub Education ](https://education.github.com/pack#offers). Among them you will also get access to GitHub Copilot to use Artificial Intelligence to help your coding development GitHub Copilot  [ GitHum Copilot ](https://education.github.com/experiences/primer_copilot) that will be used later in this module. Therefore apply to GitHub Education [https://education.github.com/pack/join](https://education.github.com/pack/join) straight away.
    
In some cases it could take up to two weeks to grant your licence so do not delay since you won't be able to follow this course without it. Send me by email, your GitHub ID once you get it, to give you access to the practical material on this module.
    
# Introduction
   
This Bioinformatics materials have been evolving since 2017 and therefore there where several hurdles to overcome since then. Initially, they ran on a HPC cluster on Birkbeck University London but it was difficult to manage dozens students accounts without interfering with normal users. Then I changed to a UNIX Virtual Machine (VirtualBox) that were installed on each student computer. This was successfully used on UCL (London), Birkbeck (London), UNAV (Navarra) and UPNA (Navarra). Unfortunately, this throw some difficulties as the need of 40Gb of empty disk space, computer crashes and later on, make impossible to continue with the appearance of the new M1-M2 chipsets on MACs that do not allow virtualisation. As a proof of concept, on 2022-2023 I decided to move to a cloud environment one class. This year 2023-2024 all the materials have been designed to run on Gitpod cloud environment integrated on Visual Studio code IDE and allowing a visual Desktop interface. So I expect several errors, so bear with me and beg you pardon! 



# Classes content 

All the materials will be handed to you over Moddle or ADI. Lectures will be PDF files that contain all the theory notions that you will need to carry on this module. Practical session will be handed in html and PDF formats to store for future enquiry and print (inadvisable). To follow classroom lectures, I recommend to open practicals folder or click on below links to each practical to follow the last version of the same material. Once you open Gitpod right click to corresponding markdown practical (e.g. ` practicals/Intro_into_Gitpod.md ` ended in .md), and open with build-in Markdown preview.
   
## Intro into Gitpod
    
This manual contains a basic introduction on the Gitpod use [ [ Gitpod ](https://www.gitpod.io/) ](https://www.gitpod.io/) a Unix system emulating a small HPC. Its a cloud system that could also work in our desktop Visual Studio Code. Therefore we will learn Unix, Cloud computing, HPC, IDE integration and we will solve Biological problems and using NGS data. So it´s a perfect system to learn Bioinformatic data analyses. The only drawback is that on the free version we are allowed to use it 50 hours a month. This should suffice to work out this module but in case you need more time a simple subscription of 9€ will give you 100 extra hours.
    
We will explore all Gitpod capabilities through learning during this module practicals. A simple manual to get started for this module development:
    
- Simple Manual 
   
[ Intro into Gitpod ]( practicals/docs/Intro_into_Gitpod.pdf )
    
But if you wish to learn more and use for your own purposes you could study those materials:
    
- Getting Started 
[ Getting Started ](https://www.gitpod.io/docs/introduction)
    
- Video Tutorials
[ Screencast ](https://www.gitpod.io/screencasts)
    
- Guides
[ Guides ](https://www.gitpod.io/guides)
    
    
## Intro to command line
    
[ Intro to command line ](practicals/Intro_into_command_line.md)

## Next Generation Sequencing
    
[ Next Generation Sequencing ](practicals/NextGenerationSequencingPractical.md)

## Genome Comparison
    
[ Genome Comparison ](practicals/GenomeComparisionPractical.md)

## RNA Sequencing and Differential Gene Expression

## Transcript Sequencing
    
## Snakemake Pipelines

## GitHub IA with Copilot
    

