clear;
clc;
addpath('E:\Dropbox (MGEP)\RepositoriosGitHub\VariabilityModelingSimulinkTutorial\Manipulation')


configurationFile ='Variant00001.config';

%conf = read_configuration(configurationFile);

if isFeatureInConf(configurationFile,'Addition') %To be implemented
    add = 1;
elseif isFeature(conf,'Substraction')
    add = 2;
else
    disp('Not valid configuration');
end



