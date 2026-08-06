# 00_initial/

Raw GEMs exactly as obtained from their source publication or repository - one subfolder per
model, in whatever format the authors distributed (SBML, MATLAB `.mat`, JSON, Excel).

Nothing here is loaded by the analysis notebooks. This tier exists so the provenance of every
model is traceable and the conversion in `../01_SBML_models/` can be re-derived. Do not reformat
or "clean up" these files - that includes the two `.xls` files, which were deliberately left as
Excel when the rest of the repo moved to CSV.
