# analysis/model_preparation/

One-off scripts that built the processed model tiers in `../data/models/`. These are **not** part
of the analysis pipeline and are not re-run routinely - they are kept so the processing is
reproducible and auditable.

- `001_standardization.ipynb` - converts the raw models to SBML and renames ids to BiGG.
- `002_validation.ipynb` - checks the converted models still behave as expected.
- `JSON_conversion.ipynb`, `eciYO844_conversion.m`, `Pangenomic_Submodel.m` - format-specific
  conversions for the models that did not ship as SBML.
