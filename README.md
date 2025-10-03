# Codespaces NGS Practicals

[![GitHub Codespaces](https://img.shields.io/badge/GitHub-Codespaces-181717?logo=github)](https://github.com/codespaces)

This repository ([FairTeach/codespaces_NGS](https://github.com/FairTeach/codespaces_NGS)) hosts the teaching materials for the Next Generation Sequencing (NGS) practicals. The 2025 refresh targets GitHub Codespaces and ships an Ubuntu-based desktop environment with Xfce, noVNC, Miniforge+mamba, IGV, and supporting bioinformatics tooling.

## Overview
- End-to-end practicum content spanning command-line skills, NGS analysis, and downstream interpretation.
- Reproducible Codespaces devcontainer with graphical desktop access for GUI-oriented workflows.
- Course assets delivered in Markdown, HTML, and PDF to support classroom delivery and self-study.
- Supplementary resources (reference genomes, datasets, figures) organised under `course_materials/` and `practicals/`.

## Requirements
- Approved GitHub account (students should request GitHub Education benefits for full access to course repositories and GitHub Copilot).
- Stable internet connection to run GitHub Codespaces within the browser or VS Code desktop.
- Optional: local PDF reader for offline lecture documents (`README.pdf`, `practicals/docs/*.pdf`).

## Codespaces Environment
- Base image: `mcr.microsoft.com/devcontainers/base:ubuntu-22.04` with the Dev Containers desktop-lite feature.
- Desktop stack: Xfce exposed via TigerVNC/noVNC on forwarded port `6080` (password `vscode` by default).
- Tooling: Miniforge+mamba (conda), IGV desktop, common bioinformatics CLI utilities, and VS Code extensions tailored for genomics.
- Automation: `.devcontainer/postCreate.sh` handles conda initialisation and browser provisioning for the desktop session.

For a step-by-step walkthrough on creating and operating a Codespace for this course, see `practicals/Intro_into_Codespaces.md`.

## Repository Structure
- `practicals/`: Guided exercises for each class (Markdown originals plus supporting docs and figures).
- `course_materials/`: Reference genomes, resources, and source assets used across the modules.
- `env/`: Environment definitions and auxiliary scripts.
- `README.html` / `README.pdf`: Exported versions for distribution outside GitHub.

## Practical Modules
- `practicals/Intro_into_Codespaces.md`: Launching the Codespaces workspace and using the remote desktop.
- `practicals/Intro_into_command_line.md`: Shell fundamentals for bioinformatics workflows.
- `practicals/NextGenerationSequencingPractical.md`: Core NGS analysis pipeline.
- `practicals/GenomeComparisionPractical.md`: Comparative genomics practical.
- Additional modules on RNA-Seq, transcript sequencing, Snakemake, and GitHub Copilot integration are under development.

## Staying Up to Date
- Watch the repository on GitHub for release notes and updates.
- Rebuild your Codespace when `.devcontainer/` changes land to pick up new tooling.
- Report environment issues via repository discussions or pull requests.

---

The teaching material has evolved from on-premises HPC clusters to local virtual machines and now GitHub Codespaces, delivering a consistent browser-based environment without the maintenance overhead of local virtualisation.



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
    
