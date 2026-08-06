# Comparative analysis of *Bacillus subtilis* genome-scale metabolic models

Data, code and manuscript for a systematic comparison of the genome-scale metabolic models (GEMs)
published for *Bacillus subtilis*.

> **Publication:** *link to be added upon publication*

Ten reconstructions were standardized to BiGG nomenclature, annotated with Systems Biology Ontology
terms and evaluated under a single M9 minimal medium against six tests: structural quality and
annotation depth, growth on multiple carbon sources, growth in chemostat culture with and without
deletion of the cytochrome *caa*₃ oxidase, intracellular flux distributions across central carbon
metabolism, gene essentiality, and Biolog carbon-source utilization. Each test is scored with the
statistic suited to it — the concordance correlation coefficient for quantitative predictions, the
Matthews correlation coefficient for binary classification.

Every figure and table in the manuscript is regenerated from the notebooks in `analysis/`; nothing
is assembled by hand.

## Repository layout

```
manuscript/       LaTeX source of the article (main.tex, Ref.bib, main.pdf)
supplementary/    LaTeX source of the supplementary material
analysis/
  data/
    models/       The GEMs at three stages: as obtained, standardized to SBML/BiGG,
                  and SBO-annotated (the versions every notebook loads)
    datasets/     Experimental reference data (medium, growth, fluxes, essentiality, Biolog)
  model_preparation/  One-off scripts that produced the standardized and annotated models
  notebooks/      The analysis pipeline, numbered in run order
  results/        Generated figures, tables and MEMOTE reports
```

Each folder has its own short `README.md` describing what it holds.

## Reproducing the analysis

**1. Create the environment.** All dependencies are pinned in `environment.yml`:

```
conda env create -f environment.yml
conda activate bacillus_gems
```

An LP solver is required. The analyses were run with Gurobi under an academic licence; COBRApy
falls back to whatever solver it finds otherwise.

**2. Run the notebooks in numerical order** from `analysis/notebooks/`. Each stage reads from
`data/` and from earlier stages' output in `results/`, and writes its own results back:

| # | Notebook | Produces |
|---|---|---|
| 01 | Structural counts and MEMOTE scoring | `Score.csv`, MEMOTE HTML reports |
| 02 | SBO term classification | `SBO_Reaction_Matrix.csv` |
| 03 | Literature growth experiments and the *caa*₃ knockout | `*_results.csv`, `terminal_oxidase_flux.csv` |
| 04 | Fit metrics and relative-error heatmaps | `*_metrics.csv`, `Heatmap_*.pdf` |
| 05 | Glucose scan and glucose × oxygen phenotype phase planes | `PhPP*.csv`, `3d_PhPP/` |
| 06 | Gene essentiality against the experimental set | `GeneEssentiality.csv` |
| 07 | Central carbon fluxes and agreement metrics | `carbon_metabolism_*.csv` |
| 08 | Biolog carbon-source utilization | `carbon_utilization_*.csv` |
| 09 | Assembly of the manuscript's composite figures | `Fig_*.pdf` |

Notebook 09 runs last because it needs output from both 04 and 05. `00_example FBA.ipynb` is a
worked FBA/pFBA demonstration and is not part of the pipeline.

Three models — `iBsu1103`, `iBsu1103v2` and `iBsu1209` — are excluded from notebook 03 onward,
after returning infeasible or unrealistic growth predictions; they are retained for the structural
comparisons in 01 and 02. Models appear in figures in a fixed order: iYO844, iBsu1147, eciYO844,
iBB1018, iBsu1147R, ecBSU1, Submodel.

**3. Build the documents.** The LaTeX sources include the generated figures directly by relative
path, so re-running a notebook and recompiling is enough to propagate a change:

```
cd manuscript    && latexmk -pdf main.tex
cd supplementary && latexmk -pdf main.tex
```

## Data format

Input datasets and generated tables are CSV, one table per file. The only Excel files are two
untouched model sources kept for provenance in `analysis/data/models/00_initial/`.

The single figure not produced by the pipeline is `manuscript/figures/Timeline.pdf`, a hand-drawn
diagram of the GEM reconstruction timeline.

## Licence

*To be added.*
