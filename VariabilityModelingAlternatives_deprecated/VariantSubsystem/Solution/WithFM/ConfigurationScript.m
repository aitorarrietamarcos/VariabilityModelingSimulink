clear;
clc;
addpath('E:\Dropbox (MGEP)\RepositoriosGitHub\VariabilityModelingSimulinkTutorial\Manipulation')


Addition = Simulink.Variant ('add ==1');
Substraction = Simulink.Variant ('add ==0');

configurationFile ='Variant00001.config';

%conf = read_configuration(configurationFile);

if isFeatureInConf(configurationFile,'Addition') %To be implemented
    add = 1;
elseif isFeature(conf,'Substraction')
    add = 0;
else
    disp('Not valid configuration');
end



