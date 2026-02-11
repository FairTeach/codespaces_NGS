# Coursework Task 1 Template — Automated NGS Pipeline

This template is the student-facing version of Task 1 from `FinalCourseWork.pdf`. Keep it open while you build your Bash automation so you can fill in the prompts, document your decisions, and ensure you meet every requirement before submission.

---

## 1. Coursework Brief (read carefully, then summarise in your own words)

> *“In this coursework task, you will leverage the power of scripting to automate the analysis pipeline for processing sequencing data… Your objective is to develop a script that streamlines the analysis process for the NGS1 practical, specifically focusing on improving mapping statistics of BQ.fq sequencing reads.”*

- **Goal:** Write a Bash script that intelligently selects and applies Cutadapt/Bowtie2 parameters to maximise alignment accuracy and efficiency for the NGS1 dataset.
- **Scope:** Your workflow must accommodate any FASTQ input, run QC, parse QC metrics, map reads with Bowtie2, capture statistics (e.g., via MultiQC), and report the impact of parameter choices.
- **Deliverables:** Script + Markdown/HTML/PDF write-up with code listings, logs, figures, and a short interpretation of optimisation decisions (see `Final_Coursework.md` for the global submission checklist).

Use the space below to jot down your interpretation of the brief (what problem you are solving, what “success” looks like, risks, etc.).

```
<Summarise the brief in your own words here.>
```

---

## 2. Requirements Snapshot (copy/paste from the PDF and tick as you plan)

- [ ] Script runs end-to-end from QC → mapping → stats with minimal manual intervention.
- [ ] Accepts CLI parameters: output name, reads (FASTQ), Bowtie2 index path, Bowtie2 parameter string.
- [ ] Performs:
  1. Quality control (FastQC or equivalent).
  2. QC parsing / metric extraction.
  3. Mapping with Bowtie2 using different parameter settings.
  4. Statistical analysis/log capture (MultiQC or similar).
- [ ] Works on any FASTQ input, not hard-coded to a single dataset.
- [ ] Logs commands/parameters so another student can replicate your optimisation.
- [ ] Removes intermediates **after** stats are captured.

Add any extra requirements agreed with the instructor (e.g., environment modules):

```
<Additional constraints or extensions go here.>
```

---

## 3. Script Template (fill in every TODO)

```bash
#!/bin/bash
# ===========================================
#  Course: Análisis e interpretación de datos de alto rendimiento
#  Coursework: Task 1 – Automated NGS Pipeline
#  Author: <TODO: student name(s)>
#  Date:   <TODO: yyyy-mm-dd>
#  Purpose: <TODO: one-sentence goal>
#  Usage:  bash <script_name>.sh <reads.fq.gz> <bowtie2_index_prefix> "<bowtie2_params>"
# ===========================================

set -euo pipefail

# ---- 1. Input arguments ------------------------------------------------------
OUTPUT_NAME="${1:-TODO_output}"
READS="${2:-TODO_reads}"
INDEX_PREFIX="${3:-TODO_index}"
BOWTIE2_PARAMS="${4:-TODO_params}"

echo "[INFO] Output name:        ${OUTPUT_NAME}"
echo "[INFO] Reads (FASTQ):      ${READS}"
echo "[INFO] Bowtie2 index:      ${INDEX_PREFIX}"
echo "[INFO] Bowtie2 parameters: ${BOWTIE2_PARAMS}"

# TODO: add argument validation / help message if inputs are missing.

# ---- 2. Quality control ------------------------------------------------------
# TODO: FastQC command(s)
# Example:
# fastqc "${READS}" --outdir qc_raw

# TODO: Parse QC outputs or summarise key metrics for later reporting.

# ---- 3. Optional trimming / preprocessing -----------------------------------
# TODO: Cutadapt (or equivalent) command; document rationale for chosen options.
# TRIMMED_READS="${OUTPUT_NAME}_trimmed.fq.gz"
# cutadapt ... "${READS}" -o "${TRIMMED_READS}"
# READS_TO_MAP="${TRIMMED_READS}"
# If no trimming, set READS_TO_MAP="${READS}"

# ---- 4. Mapping --------------------------------------------------------------
echo "[INFO] Mapping reads with Bowtie2"
echo "[CMD ] bowtie2 ${BOWTIE2_PARAMS} -x ${INDEX_PREFIX} -q ${READS_TO_MAP:-$READS} -S ${OUTPUT_NAME}.sam"
time bowtie2 ${BOWTIE2_PARAMS} \
  -x "${INDEX_PREFIX}" \
  -q "${READS_TO_MAP:-$READS}" \
  -S "${OUTPUT_NAME}.sam" \
  2> "${OUTPUT_NAME}_bowtie_stats.txt"

# TODO: Loop over alternative parameter sets if you plan to compare runs.

# ---- 5. Post-processing ------------------------------------------------------
# TODO: samtools view/sort/index commands capturing stats into text files.

# ---- 6. MultiQC / reporting --------------------------------------------------
# TODO: multiqc invocation (use dedicated output directory for clarity).
# multiqc . -f -o "multiqc_${OUTPUT_NAME}"

# ---- 7. Cleanup --------------------------------------------------------------
# TODO: remove intermediates *after* verifying stats were collected.
# rm -f "${OUTPUT_NAME}.sam" "${OUTPUT_NAME}_bowtie_stats.txt"

echo "[DONE] Pipeline completed for ${OUTPUT_NAME}"
```

> **Tip:** keep the template lightweight. Replace each `TODO` with your actual logic, but avoid hard-coding anything that should remain configurable.

---

## 4. Parameter Exploration Log

Document the Bowtie2/Cutadapt parameter sets you tested, the rationale, and the resulting metrics (alignment %, properly paired %, etc.). Tables or bullet lists are fine.

| Run ID | Key parameters | Metric highlights | Notes / decision |
|--------|----------------|-------------------|------------------|
|        |                |                   |                  |

---

## 5. QC & Mapping Interpretation

Summarise insights from your automated pipeline:
- How did QC metrics inform trimming or parameter choices?
- Which Bowtie2 settings maximised mapping performance?
- What trade-offs (speed vs. accuracy) did you observe?

```
<Write your interpretation here. Reference figures/logs where needed.>
```

---

## 6. Ideas to push automation (and reproducibility) further

- **Parameter grids:** loop over multiple Cutadapt/Bowtie2 combinations and automatically select/report the best-scoring run (store metrics in CSV/JSON).
- **Config files:** read inputs and tool settings from a `.env` or YAML/JSON file so teammates can reproduce your run by editing a single document.
- **Logging helpers:** pipe every command through `tee -a ${output_name}.log`, timestamp key stages, and print summaries at the end.
- **Workflow guards:** detect whether required binaries exist, automatically create conda/mamba environments if missing, and validate FASTQ/index paths before running heavy steps.
- **Parallelisation:** use `GNU parallel` or background jobs to evaluate parameter sweeps faster (after checking available CPUs/RAM).
- **Notifications:** send a desktop/SMS/Slack alert when the script finishes or fails by checking exit codes.
- **Packaging:** ship a small `Makefile`, wrapper, or `--config` mode so the same script can launch analyses for multiple datasets without edits.
- **Self-diagnostics:** add `--dry-run` / `--check` modes that print intended commands, helping you debug before spending HPC hours.

---

## 7. Submission Checklist (Task 1 specific)

- [ ] Script saved alongside README/usage notes in your repo.
- [ ] Markdown / PDF write-up includes:
  - [ ] Brief introduction & objectives.
  - [ ] Methodology referencing this template.
  - [ ] Code snippets or Git references.
  - [ ] QC/MultiQC figures and parameter comparison tables.
  - [ ] Discussion of optimisation strategy.
- [ ] Logs/plots packaged with the submission.
- [ ] All sources (tutorials, datasets) cited properly.

---

## 8. Helpful References

- [`CourseWork_Task1.Rmd`](CourseWork_Task1.Rmd) — original R Markdown handout with runnable chunks.
- `FinalCourseWork.pdf` — official wording of Task 1, 2, and 3 from the module brief.
- Bash resources:
  - https://devhints.io/bash
  - https://www.codecademy.com/learn/learn-the-command-line/modules/bash-scripting
  - https://linuxconfig.org/bash-scripting-tutorial-for-beginners
  - https://en.wikibooks.org/wiki/Bash_Shell_Scripting

Fill this template as you develop your solution; it doubles as documentation for your final report.
