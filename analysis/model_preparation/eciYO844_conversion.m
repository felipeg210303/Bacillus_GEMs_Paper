%Tested in MATLAB R2022
%Paths below are built from this script's own location (analysis/model_preparation),
%so they resolve correctly regardless of MATLAB's current folder when it is run.
scriptDir = fileparts(mfilename('fullpath'));

%1. Load the .mat model
load(fullfile(scriptDir,...
    '..','data','models','00_initial','eciYO844','ec_iYO844.mat'));
%use "whos" to check the loaded variable name if it differs from below
model = ec_iYO844;

%2-5. Clean metabolite/reaction/gene IDs before export: writeCbModel's SBML
%writer otherwise leaves bracketed compartment tags (e.g. "metabolite[c]")
%and stray whitespace in the IDs, which the SBML validator/downstream tools
%don't accept and which get silently mangled by regex substitutions on
%re-import. Converting "[c]" to "_c" and stripping whitespace up front
%avoids that problem.
model.mets = regexprep(model.mets, '\[(\w+)\]', '_$1');
model.rxns = regexprep(model.rxns, '\[(\w+)\]', '_$1');
model.genes = regexprep(model.genes, '\[(\w+)\]', '_$1');

model.mets = regexprep(model.mets, '\s+', '_');
model.rxns = regexprep(model.rxns, '\s+', '_');
model.genes = regexprep(model.genes, '\s+', '_');

%6. Export to SBML using the cleaned IDs directly
%output written to analysis/data/models/01_SBML_models, alongside the other SBML models
writeCbModel(model, 'format', 'sbml', 'fileName', fullfile(scriptDir,...
    '..','data','models','01_SBML_models','eciYO844.xml'));
disp('OK written')
