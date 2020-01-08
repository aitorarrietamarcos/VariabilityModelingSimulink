clear;
clc;

addpath('E:\Dropbox (MGEP)\RepositoriosGitHub\VariabilityModelingSimulink\SimManipulation');



configurationName = 'Variant00001.config';

if isFeatureInConf(configurationName,'Addition')
    add = 1;
elseif isFeatureInConf(configurationName,'Substraction')
    add = 2;
else
    disp('Not valid config');
end