---
title: "Snakemake Tutorial Setup"
author: "Igor Ruiz de los Mozos"
output:
  pdf_document: default
  html_document: default
---

# Snakemake Tutorial Setup

Source adapted from the official Snakemake tutorial setup page:
https://snakemake.readthedocs.io/en/stable/tutorial/setup.html#setup

Before beginning the tutorial, you need to set up the required software environment. The tools used throughout this tutorial are listed below for reference — **do not install them manually yet**, as the setup process in the next sections will handle installation automatically in a controlled, isolated environment:

| Tool | Version |
|------|---------|
| Python | ≥ 3.5 |
| Snakemake | ≥ 5.24.1 |
| BWA | 0.7 |
| SAMtools | 1.9 |
| Pysam | 0.15 |
| BCFtools | 1.9 |
| Graphviz | 2.42 |
| Jinja2 | 2.11 |
| NetworkX | 2.5 |
| Matplotlib | 3.3 |

Installing these tools one by one and managing version conflicts manually would be tedious and error-prone. Instead, we use a package and environment manager (either Gitpod in the cloud, or Miniforge locally) which automatically resolves dependencies and installs everything needed in an isolated environment. This way, the tutorial software does not interfere with any other software on your system.

## Option 1: Run in the cloud with Gitpod

The easiest and quickest way to run this tutorial is to use **Gitpod**, a cloud-based development environment that runs entirely in your browser. Gitpod provisions a pre-configured workspace — a Linux virtual machine in the cloud — with all the required software already installed. This means you do not need to install anything on your local machine, and you can start working with Snakemake immediately.

To launch the environment, open the predefined snakemake-tutorial Gitpod workspace directly in your browser:

- https://gitpod.io/#https://github.com/snakemake/snakemake-tutorial-data

Gitpod provides you with a **Theia development environment**, which is a browser-based IDE (Integrated Development Environment) similar to VS Code. It includes a file explorer, code editor, and an integrated terminal — everything you need to follow the tutorial exercises. Once your Gitpod workspace has finished loading and you can see the terminal, you can skip directly to the tutorial exercises.

> **Important note about the Gitpod terminal:**  
> A common issue when using the Gitpod terminal is accidentally pressing **Ctrl+S** while the terminal is focused (instead of the editor), because you intended to save a file. Pressing Ctrl+S in a Unix terminal activates terminal flow control and **freezes the terminal**, making it appear unresponsive.  
> To unfreeze it, click on the terminal to make sure it is focused, then press **Ctrl+Q**. This sends the XON signal and resumes the terminal output.

## Option 2: Local setup (Miniforge only)

Use this option if you prefer to run the tutorial entirely on your own machine rather than in the cloud. This gives you more control over the environment and the files, and it means the workflow and results persist locally after the tutorial is complete.

The tutorial assumes you are running either **Linux** or **macOS**. Snakemake and Miniforge do work on Windows, but the Windows command-line shell (cmd.exe or PowerShell) is too different from the Unix shell to follow the tutorial examples as written.

- If you are on **Linux or macOS**, proceed directly to Step 1 below.
- If you are on **Windows**, you must first set up a Unix-like environment before continuing. The recommended approach is to install the **Windows Subsystem for Linux (WSL)**, which allows you to run a native Linux distribution (such as Ubuntu) directly on Windows 10 or 11 without a virtual machine. Follow the [official WSL installation instructions](https://docs.microsoft.com/en-us/windows/wsl/install) from Microsoft, then open a WSL terminal and follow the Linux steps below. If you are on an older version of Windows (before Windows 10) or prefer not to use WSL, you can alternatively use a **Vagrant virtual machine**: install [Vagrant](https://www.vagrantup.com/docs/installation), create a shared directory (e.g. `vagrant-linux`), run `vagrant init hashicorp/precise64 && vagrant up` inside it to create a 64-bit Ubuntu VM, and connect to it via `vagrant ssh`. The `vagrant-linux` folder will be shared between Windows and the VM. Either way, once you have a Linux terminal, follow the steps below.

> **Note on ARM-based Macs (Apple M1/M2/M3):** The tutorial setup currently only fully supports **Intel-based (x86_64) machines**. If you have an Apple Silicon Mac, you can use Rosetta to emulate the x86_64 architecture, or alternatively use the Gitpod cloud option described above.

### Step 1: Install Miniforge

**Miniforge** is a minimal Python 3 distribution based on [Conda](https://docs.conda.io/), similar to Miniconda but defaulting to the community-maintained `conda-forge` channel and bundling [Mamba](https://mamba.readthedocs.io/) — a faster and more robust drop-in replacement for the `conda` command. Mamba uses a C++ dependency solver that resolves package dependencies significantly faster than the original Conda solver, which is particularly valuable when creating complex environments like the one needed for this tutorial.

Once Miniforge is installed, you will have access to the `conda` and `mamba` commands, which allow you to create isolated software environments. Each environment is a self-contained directory with its own Python interpreter and packages, so installing or updating packages in one environment never affects another.

Download and run the installer appropriate for your operating system and CPU architecture:

#### Linux (x86_64)

```bash
curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -o Miniforge3-Linux-x86_64.sh
bash Miniforge3-Linux-x86_64.sh
```

#### macOS (x86_64)

```bash
curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-x86_64.sh -o Miniforge3-MacOSX-x86_64.sh
bash Miniforge3-MacOSX-x86_64.sh
```

#### macOS (arm64)

```bash
curl -L https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh -o Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh
```

The installer will walk you through a licence agreement and ask where to install Miniforge (the default location under your home directory is fine). Near the end of the installation, you will be asked:

```text
Do you wish the installer to prepend the install location to PATH ...? [yes|no]
```

Answer `yes`. This ensures that when you type `conda` or `mamba` in the terminal, the shell finds the newly installed Miniforge versions rather than any pre-existing system tools. The installer adds an initialisation block to your shell configuration file (e.g. `~/.bashrc` or `~/.zshrc`).

**After the installation finishes, close your current terminal and open a brand new one.** This is necessary for the changes to `PATH` to take effect. From that new terminal onwards you can use the `conda` and `mamba` commands.

### Step 2: Create and enter a working directory

Create a dedicated directory for the tutorial. Keeping all tutorial files in one place makes it easy to find and delete them later without affecting the rest of your system. If you are using a Vagrant Linux VM as described above, create this directory under `/vagrant/` so its contents are shared with your Windows host and can be edited with a Windows text editor that supports Unix line endings.

```bash
mkdir snakemake-tutorial
cd snakemake-tutorial
```

Next, download the tutorial example data from GitHub. This compressed archive contains the biological input data (sequencing reads and a reference genome) and the `environment.yaml` file that describes the software dependencies of the tutorial environment:

```bash
curl -L https://api.github.com/repos/snakemake/snakemake-tutorial-data/tarball -o snakemake-tutorial-data.tar.gz
```

Extract only the files needed from the archive (the `data/` directory and `environment.yaml`). The `--strip 1` option removes the top-level directory name that GitHub adds automatically to the archive, so the files land directly in `snakemake-tutorial/`:

#### Linux

```bash
tar --wildcards -xf snakemake-tutorial-data.tar.gz --strip 1 "*/data" "*/environment.yaml"
```

#### macOS

```bash
tar -xf snakemake-tutorial-data.tar.gz --strip 1 "*/data" "*/environment.yaml"
```

After extraction, your working directory should contain:

- `data/` — the example input files (FASTQ reads and a reference genome in FASTA format) that the tutorial workflow will process.
- `environment.yaml` — a Conda environment specification that lists all software packages (Snakemake, BWA, SAMtools, etc.) with pinned version numbers, ensuring reproducibility.

### Step 3: Create the Conda environment (Miniforge)

A Conda **environment** is an isolated directory that contains a specific collection of packages at specific versions. By creating a dedicated environment for this tutorial, you avoid conflicts with other software on your system and guarantee that everyone following the tutorial uses exactly the same tool versions — a core principle of reproducible bioinformatics.

The `environment.yaml` file downloaded in the previous step specifies the name of the environment (`snakemake-tutorial`) and all the packages to install. Before creating a new environment, ensure that the Conda base environment is active (this is the minimal starting environment that ships with Miniforge):

```bash
conda activate base
```

Now use `mamba` to create the tutorial environment. Mamba reads `environment.yaml`, resolves all package dependencies, downloads the packages from `conda-forge` and `bioconda`, and installs them into a new isolated environment. This step may take a few minutes depending on your internet connection:

```bash
mamba env create --name snakemake-tutorial --file environment.yaml
```

If `mamba` is not found (for example, if you installed a different Conda distribution such as Miniconda instead of Miniforge), you can first install Mamba into the base environment and then run the create command:

```bash
conda install -n base -c conda-forge mamba
mamba env create --name snakemake-tutorial --file environment.yaml
```

### Step 4: Activate environment and test Snakemake

Once the environment has been created, you need to **activate** it before you can use any of the tools it contains. Activating an environment means that your shell's `PATH` is updated so that commands like `snakemake`, `bwa`, and `samtools` resolve to the versions installed in `snakemake-tutorial` rather than any system-wide installations.

```bash
conda activate snakemake-tutorial
```

Your terminal prompt will typically change to show the name of the active environment (e.g. `(snakemake-tutorial) $`), confirming that the environment is active. You can now verify that Snakemake is correctly installed and explore its command-line options by running:

```bash
snakemake --help
```

This will print a detailed help message listing all available Snakemake flags and options. If you see this output without any errors, your environment is correctly configured and you are ready to begin the tutorial.

When you have finished working in the tutorial environment and want to return to the base environment (or simply close your session), deactivate the environment with:

```bash
conda deactivate
```

Your prompt will revert to the base environment name. The `snakemake-tutorial` environment and all its installed packages will still exist on disk and can be reactivated at any time with `conda activate snakemake-tutorial`.
