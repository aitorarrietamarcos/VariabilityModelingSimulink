clear;
clc;

addpath('E:\Dropbox (MGEP)\RepositoriosGitHub\VariabilityModelingSimulink\SimManipulation');

Addition = Simulink.Variant ('add ==1');
Substraction = Simulink.Variant ('add ==0');

configurationName = 'Variant00002.config';

if isFeatureInConf(configurationName,'Addition')
    add = 1;
else
    add = 0;
end