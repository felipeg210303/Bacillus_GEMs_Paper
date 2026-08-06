%Requires MATLAB R2022b: the version used by the other researchers on this
%project and the only one confirmed to work for this script (COBRA Toolbox
%compatibility issue with newer/older MATLAB releases).
%Paths below are built from this script's own location (analysis/model_preparation),
%so they resolve correctly regardless of MATLAB's current folder when it is run.
scriptDir = fileparts(mfilename('fullpath'));

pan_model = importdata(fullfile(scriptDir,...
    '..','data','models','00_initial','Pan-genomic model','pan_model.mat'));
rxn_strain_matrix = importdata(fullfile(scriptDir,...
    '..','data','models','00_initial','Pan-genomic model','rxn_strain_matrix.mat'));
strain_list = importdata(fullfile(scriptDir,...
    '..','data','models','00_initial','Pan-genomic model','strain_list.mat'));
%to reconstruct a strain specific model, identify its column of the rxn to
%strain association matrix, then remove the rxns associated with zeros in
%this binary vector.

%We were interested in strain 168, linked to identifier
%GCF_000009045_1 in supplementary file S1 from Neal et al., 2022:
%find where it is in the list of strains
idx = find(strcmp(strain_list,'GCF_000009045_1'));

%identify which reactions it can perform
rxn_presence = rxn_strain_matrix(:,idx);
%invert to find which reactions it cannot perform
absent = rxn_presence==0;
%then remove them
model_168=removeRxns(pan_model,pan_model.rxns(absent));

%confirm that it runs:
FBA=optimizeCbModel(model_168);
%output written to analysis/data/models/01_SBML_models, alongside the other SBML models
writeCbModel(model_168, 'sbml', fullfile(scriptDir,...
    '..','data','models','01_SBML_models','Submodel.xml'));