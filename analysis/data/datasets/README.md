# analysis/data/datasets/

Reference and experimental data, one table per CSV file.

- `M9_media.csv` - M9 minimal medium: exchange reaction id with its lower/upper flux bound.
  Applied by every simulation notebook via `set_culture_media`.
- `Chubukov_2013.csv`, `Dauner_2001.csv` - literature growth experiments: carbon source, uptake
  flux and measured growth rate per condition. Used by `03_simulations.ipynb`.
- `Carbon_metabolism_IDs.csv` - the 28 EMP/TCA/PPP reactions used in `07_fluxes.ipynb`, with
  their pathway, name and measured flux (Chubukov et al., 2013).
- `CarbonUtilization.csv` - 113 Biolog carbon sources with their `+`/`-`/`x` experimental call,
  used by `08_carbon_utilization.ipynb`.
- `Essentiality_dataset.csv` - experimental gene-essentiality calls by locus tag, used by
  `06_essentiality_analysis.ipynb`.
- `BSU_BG.csv` - locus tag to BsubCyc `BG` id mapping.
