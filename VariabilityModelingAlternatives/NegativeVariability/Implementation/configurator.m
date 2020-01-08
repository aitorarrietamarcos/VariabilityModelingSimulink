clear;
clc;

addpath('E:\Dropbox (MGEP)\RepositoriosGitHub\VariabilityModelingSimulink\SimManipulation');



configurationName = 'Variant00001.config';

if isFeatureInConf(configurationName,'Addition')
    deleteBlock('ExampleNegativeVar/Subsystem/Substraction');
    deleteBlock('ExampleNegativeVar/Subsystem/Multiport Switch');
    deleteBlock('ExampleNegativeVar/Subsystem/Substraction');
    deleteBlock('ExampleNegativeVar/Subsystem/Constant');
    addLineSafe('ExampleNegativeVar/Subsystem/Addition', 1, 'ExampleNegativeVar/Subsystem/Out1', 1);

    
    
elseif isFeatureInConf(configurationName,'Substraction')
    deleteBlock('ExampleNegativeVar/Subsystem/Addition');
    deleteBlock('ExampleNegativeVar/Subsystem/Multiport Switch');
    deleteBlock('ExampleNegativeVar/Subsystem/Substraction');
    deleteBlock('ExampleNegativeVar/Subsystem/Constant');
    addLineSafe('ExampleNegativeVar/Subsystem/Substraction', 1, 'ExampleNegativeVar/Subsystem/Out1', 1);

    
else
    disp('Not valid config');
end