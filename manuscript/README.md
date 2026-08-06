# manuscript/

LaTeX source for the paper.

- `main.tex` - the manuscript; `Ref.bib` - its bibliography; `main.pdf` - the compiled output.
- `figures/` - only the figures that have no reproducible notebook source. Everything else is
  included straight from `../analysis/results/figures/` via a relative path, so re-running a
  notebook and recompiling picks up the new version automatically.

Compile with `latexmk -pdf main.tex` (TeX Live, with `biber` for the bibliography).
