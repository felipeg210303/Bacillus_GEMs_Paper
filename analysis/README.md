# analysis/

Everything that turns the collected GEMs into the paper's figures and tables.

- `data/` - the models themselves and the reference/experimental datasets they are compared against.
- `model_preparation/` - one-off scripts that produced the processed model tiers in `data/models/`.
- `notebooks/` - the analysis pipeline proper, numbered `01`-`09` in run order.
- `results/` - everything the notebooks generate: figures, tables and MEMOTE reports.

Notebooks are run from inside `notebooks/`; every path in them is relative to that folder.
