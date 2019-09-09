clear;
clc;
addpath('E:\Dropbox (MGEP)\RepositoriosGitHub\VariabilityModelingSimulinkTutorial\Manipulation')

modelName = 'Model';

configurationFile ='Variant00001.config';

%conf = read_configuration(configurationFile);

if isFeatureInConf(configurationFile,'Addition') %To be implemented
    deleteBlock('Model/Option1/substraction');
    deleteBlock('Model/Option1/Multiport Switch');
    addLineSafe('Model/Option1/addition',1,'Model/Option1/Out1',1);
    deleteBlock('Model/Option1/Constant');
elseif isFeature(conf,'Substraction')
    deleteBlock('Model/Option1/addition');
    deleteBlock('Model/Option1/Multiport Switch');
    addLineSafe('Model/Option1/substraction',1,'Model/Option1/Out1',1);
    deleteBlock('Model/Option1/Constant');
else
    disp('Not valid configuration');
end



