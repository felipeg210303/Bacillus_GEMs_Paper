# analysis/notebooks/

The analysis pipeline. The number prefix is the run order - later notebooks read earlier ones'
output from `../results/`.

`01`-`02` are structural checks (feature counts, MEMOTE scores, SBO classification) and run on all
ten models. `03`-`09` are the FBA analyses (growth simulations, heatmaps, phenotype phase planes,
gene essentiality, carbon-metabolism fluxes, carbon utilization) and exclude `iBsu1103`,
`iBsu1103v2` and `iBsu1209`.

`00_example FBA.ipynb` is not part of the pipeline - it is a worked demonstration of why the
analyses use pFBA rather than plain FBA.

Run them from inside this folder; all paths are relative to it. See the root `README.md` for a
per-notebook description.
