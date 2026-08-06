# analysis/data/models/

The GEMs, in three tiers that document the processing pipeline. Keep them separate - each tier is
the evidence for a step described in the paper's Methods.

- `00_initial/` - raw downloads, exactly as obtained from their source.
- `01_SBML_models/` - the same models converted to SBML and renamed to BiGG nomenclature.
- `02_final_annotated/` - SBOannotator output. **This is the tier every notebook loads.**

`../model_preparation/` holds the scripts that produced tiers 01 and 02.
