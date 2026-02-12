# 🧬 Module Guide — Module: “Advanced Bioinformatics” 
## Universidad Pública de Navarra  
## Master in Biomedical Engineering  

---

### 🎯 **Module Overview**

The *Análisis e interpretación de datos de alto rendimiento* module combines **advanced omics analysis**, **bioinformatics**, and **translational project design**.  
It aims to bridge the gap between experimental High Throughput Omics Technologies, high-performance computing (HPC), and personalised medicine innovation.

Students will engage in **two major challenges**:

1. **Omics Presentation (Assessment 1):**  
   A 10–15 minute oral presentation where students explain an assigned omics review article to their peers, highlighting technologies, workflows, and biomedical impact (see `codespaces_NGS/assesments/Omics_presentation.md`).
2. **NGS Hackathon (Assessment 2):**  
   A hands-on sprint in which students align Illumina reads, optimise pipelines, and submit a reproducible report summarising code, metrics, and biological interpretation.
3. **Final Coursework (Assessment 3):**  
   A comprehensive written plus oral assessment anchored to the milestone dates shown in the **Course Calendar**. Students select **one** advanced omics task (automation pipeline, virulence investigation, DESeq2 analysis, or the optional TFM fast-track) and deliver both a PDF report and a defended presentation. All module assets and specifications live in the FairTeach teaching repositories: `FairTeach/codespaces_NGS` (this workspace) and the companion `FairTeach/codespaces_RStudio`.

By the end of the module, students will be able to:
- Work confidently in a Unix/HPC environment for omics analysis.  
- Apply critical reasoning to optimise NGS workflows.  
- Translate omics technologies into innovative project ideas.  
- Analyse High Throughput Omics data as DNA-Seq, RNA-Seq DEG, RNA-Seq splicing, and comparative genomics.
- Learn and use modern tools for reproducible research (GitHub Codespaces, RStudio Server, Markdown, etc.).
- Use high-level workflows as Snakemake or Nextflow to automate complex analyses.
- Integrate biological, computational, and ethical reasoning in a professional scientific context.  
- Present and defend their ideas effectively, both in writing and orally.

---

### 📅 **Course Calendar**

| Date | Classroom | Session | Description | 
|------|-----------|----------|-------------|
| **Feb 12 2026 (Tue)** | Classroom | **Assessment 1 Briefing** | Release of Omics Presentation instructions; students pick review articles and register slots. |
| **Feb (TBD)** | ADI | **Assessment 1 Slide Upload Deadline** | Submit Omics Presentation slide deck (PDF/PowerPoint) before in-class talks. |
| **Feb (TBD)** | Classroom | **Assessment 1 Live Presentations** | 10–15 min talks + Q&A following the Omics Presentation rubric. |
| **Mar (lab week TBD)** | Codespaces / HPC Lab | **Assessment 2 — NGS Hackathon Sprint** | In-class sprint to optimise alignment workflows; instructors provide datasets and checkpoints. |
| **Mar (TBD)** | ADI | **Assessment 2 Report Submission** | Upload the NGS Hackathon report (Markdown → PDF) with code, metrics, and interpretations. |
| **End of February** | Virtual (ADI) | **Assessment 3 Briefing Release** | Final Coursework brief published; students choose their task (1–4) and book advisor check-ins. |
| **One day before public defense (TBD)** | ADI | **Assessment 3 PDF Submission Deadline** | Upload the Final Coursework package (Task 1/2/3/4) as a PDF or HTML export with embedded code and figures. |
| **Mar 25 2026 (Wed) 17–20h** | Classroom / Tribunal (TBD) | **Assessment 3 Public Dissertation** | 15–20 min poster-style or PowerPoint defense plus Q&A before the tribunal. |


---

### 🛠️ **Specifications & Platforms**

- **FairTeach/codespaces_NGS:** Ubuntu 22.04 GitHub Codespace with a desktop-lite (Xfce + noVNC) layer, Miniforge+mamba, IGV, FastQC, Cutadapt, Bowtie2, Samtools, MultiQC, and walkthroughs in `practicals/*.md`. Automation and package initialisation run through `.devcontainer/postCreate.sh`.
- **FairTeach/codespaces_RStudio:** Rocker-based RStudio Server (port 8787) plus optional XFCE desktop (port 6080), the `rnaseq-tools` mamba environment defined at `env/mamba-environment.yml`, and preinstalled Bioconductor stacks (DESeq2, clusterProfiler, IsoformSwitchAnalyzeR, etc.) for RNA-seq case studies.
- **Shared workflow:** Both repos rely on GitHub Education accounts, Codespaces/VS Code Dev Containers, and reproducible devcontainers so every student opens the same toolkit whether in the browser or locally.

---

### 🧩 **Tasks and Deliverables**

#### **Assessment 1 — Omics Presentation**
- **Goal:** Introduce a cutting-edge omics technology to classmates through a 10–15 minute presentation grounded in one or more provided review articles.
- **Deliverables:**  
  - Slide deck (PDF or PowerPoint) uploaded before the session.  
  - Live presentation including: motivation, technology overview, workflow diagram (original), key article figures (cited), impact, and Q&A handling.
- **Specifications:** Full brief and rubric in `codespaces_NGS/assesments/Omics_presentation.md`. Presenters may work solo or in pairs; article sign-up required.
- **Evaluation:** Presentation quality, visual design, conceptual understanding, and Q&A performance (see Grading Criteria below).

#### **Assessment 2 — NGS Hackathon**
- **Goal:** Align Illumina NGS reads using bioinformatics tools, improving alignment metrics and accuracy while demonstrating command-line proficiency.
- **Deliverables:**  
  - Markdown/PDF report with code snippets, parameter logs, QC screenshots, and biological interpretation.  
  - Repository (or zipped folder) containing scripts/notebooks necessary to reproduce the best-performing pipeline.
- **Evaluation:** Technical accuracy (40%), reproducibility (30%), interpretation (30%). Teams may collaborate during the sprint but must clearly attribute contributions in the report.

#### **Assessment 3 — Final Coursework (PDF + Public Dissertation)**
- Individual dossier + tribunal defense worth 60% of the module (30% written, 30% oral). Official dates live in the **Course Calendar**.
- Full specifications: `codespaces_NGS/assesments/Final_Coursework.md` (task brief) and `codespaces_NGS/assesments/CourseWork_Task1.md` for the automation template.
- Task options (pick one):  
  1. **Automated NGS pipeline:** Bash-driven version of the NGS1 workflow with reproducible parameter logging.  
  2. **Bacterial genome comparison:** Virulence panel + BRIG analysis to identify intervention targets in *E. coli* AFPN02.1.  
  3. **RNA-seq DESeq2 analysis:** Full DGE workflow with filtering, plots, GO/KEGG enrichment, and batch-effect commentary.  
  4. **Optional TFM fast-track:** Early Máster thesis package aligned with module scope and pre-approved by Igor.
- Deliverables: One PDF/HTML package (code, figures, citations) plus a 15–20 min poster/PowerPoint defense. Details and rubrics are inside the coursework brief.
- Evaluation: Minimum 5/10 required in both written and oral components (see grading table below).

---

### 🧾 **Grading Criteria**

| Component | Weight | Description |
|------------|--------|-------------|
| **Assessment 1 — Omics Presentation** | 20% | Clarity of exposition, slide design (original + article figures), understanding of the review, and Q&A performance. |
| **Assessment 2 — NGS Hackathon** | 30% | Hands-on technical analysis, command-line proficiency, workflow optimisation, and interpretation. |
| **Assessment 3 — Final Coursework (PDF)** | 30% | Depth of computational/biological reasoning, code quality, figures, and clarity of documentation within the chosen task. |
| **Assessment 3 — Public Dissertation** | 20% | Storytelling, scientific defense, visual quality (poster/PowerPoint), handling of questions, and translation of findings into recommendations. |

> 💡 A minimum score of **5** is required in each component to pass the module.

---

### 🧠 **Detailed Evaluation Rubric**

| Criterion | Excellent (9–10) | Good (7–8) | Satisfactory (5–6) | Poor (<5) |
|------------|-----------------|-------------|---------------------|------------|
| **Scientific understanding** | Deep, accurate, integrated biological & computational reasoning | Mostly correct with minor gaps | Partial understanding | Major conceptual errors |
| **Bioinformatics proficiency** | Expert use of tools, automation, and reproducibility | Competent with minor issues | Basic tool use, some manual steps | Incorrect or no tool usage |
| **Innovation & originality** | Highly original and creative idea | Moderate innovation | Derivative or limited novelty | Repetition of known concepts |
| **Feasibility & methods** | Clear, realistic methodology, technically detailed | Mostly sound but some missing details | Feasible but underdeveloped | Unrealistic or unclear |
| **Biological interpretation** | Strong and insightful integration of omics into biology | Good but lacks depth in discussion | Basic level of biological link | Weak or absent biological analysis |
| **Data visualisation / Figures** | Clear, professional, self-explanatory | Readable, minor design issues | Limited clarity | Poorly labelled or irrelevant |
| **Presentation / communication** | Engaging, concise, confident, well-structured | Mostly clear and coherent | Acceptable but uneven | Unstructured or unclear presentation |

---

### 🧭 **Student Guidance**

- Secure your GitHub Education account early so you can open both `FairTeach/codespaces_NGS` and `FairTeach/codespaces_RStudio` in GitHub Codespaces or VS Code Dev Containers.
- Follow the repo READMEs for authentication details (e.g., RStudio Server credentials `rstudio` / `rstudio`, Codespaces desktop password `vscode` in the NGS image).
- Keep project notes in Markdown, linked to your scripts/notebooks inside each repo, and cite every external dataset or pipeline you reuse.
- When collaborating, log individual contributions; only the final writeup and defense are graded individually.

---

### 🧰 **Software and Resources**

- **codespaces_NGS stack:** Devcontainer image (`mcr.microsoft.com/devcontainers/base:ubuntu-22.04`) with FastQC, Cutadapt, Bowtie2, Samtools, MultiQC, IGV, Miniforge+mamba, and desktop-lite (Xfce + noVNC). Use VS Code or the browser desktop to follow `practicals/*.md`.
- **codespaces_RStudio stack:** Rocker-based RStudio Server (port 8787) plus XFCE desktop (port 6080), preloaded Bioconductor packages (DESeq2, clusterProfiler, IsoformSwitchAnalyzeR, airway, SummarizedExperiment, etc.), and the `rnaseq-tools` mamba env for CLI utilities (FastQC, MultiQC, Salmon, STAR, samtools).
- **Editors & docs:** VS Code with Markdown tooling for NGS workflows, and RStudio Server for R/Bioconductor notebooks; export deliverables to PDF/HTML from either toolchain.
- **Visualization & references:** BioRender/Figma/PowerPoint for figures; Zotero or Mendeley for citation management; public datasets from GEO, ENCODE, Zenodo, or the `course_materials/` folders inside each repo.

---

### 📬 **Submission Summary**

| Task | Format | Deadline | Platform |
|------|---------|-----------|-----------|
| **Omics Presentation Slides (Assessment 1)** | PowerPoint or PDF deck | See Course Calendar (Assessment 1 slide upload) | ADI |
| **NGS Hackathon Report (Assessment 2)** | Markdown → PDF (with repo link) | See Course Calendar (Assessment 2 report submission) | ADI |
| **Final Coursework (Assessment 3) PDF/HTML** | Markdown-first PDF or HTML with embedded code + figures | See Course Calendar (Assessment 3 PDF submission milestone) | ADI |
| **Final Coursework Public Dissertation** | Poster-style or PowerPoint (15–20 min + Q&A) | See Course Calendar (Assessment 3 public dissertation) | In-class tribunal |

---

### 🧩 **Learning Outcomes**

By completing this module section, students will:
1. Launch and manage reproducible GitHub Codespaces/Dev Containers from `FairTeach/codespaces_NGS` and `FairTeach/codespaces_RStudio`, including desktop-lite and RStudio Server workflows.  
2. Visit a real HPC facility NASERTIC CPD, and a real Sequencing Facility and Systems Biology Lab(IRIS Polo de Innovación Digital) to understand the physical infrastructure supporting omics analyses and the role of HPC in personalised medicine.
3. Automate NGS pipelines with Bash, Miniforge/mamba environments, and core CLI tools (FastQC, Cutadapt, Bowtie2, Samtools, MultiQC, IGV).  
4. Execute RNA-seq and omics analyses in RStudio using the preinstalled Bioconductor stack (DESeq2, clusterProfiler, IsoformSwitchAnalyzeR, etc.) and document outputs in Markdown or R Markdown.  
5. Integrate comparative genomics, differential expression, and translational case studies into coherent project proposals aligned with personalised medicine challenges.  
6. Communicate findings effectively through reproducible repositories, ADI submissions, and tribunal defenses while crediting all external resources.  
7. Critically evaluate how cloud-based HPC, automation, and R/Bioconductor tooling accelerate research translation and de-risk their future TFM projects.

---

### 🧬 **Contact and Support**

**Professor:** Igor Ruiz de los Mozos Aliaga  PhD
**Institution:** NASERTIC / UPNA  
**Email:** igor.ruiz@unav.es  
**Office hours:** By appointment  
**Facilities:** IRIS Polo de Innovación Digital – Molecular Biology, Synthetic Biology, and HPC laboratories  

---

**End of Module Guide**
