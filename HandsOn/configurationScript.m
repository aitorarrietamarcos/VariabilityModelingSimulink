clear;
clc;

addpath('E:\Dropbox (MGEP)\RepositoriosGitHub\VariabilityModelingSimulink\SimManipulation');
init; %Initialize variables

configName = 'default';
configFileName = [configName '.config'];

simulinkConfigurationNameNoSLX = ['TanksModel_' configName];
simulinkConfigurationName = ['TanksModel_' configName '.slx'];
copyfile('TanksModel.slx',simulinkConfigurationName);
open(simulinkConfigurationName);

if ~isFeatureInConf(configFileName, 'Maintenance')
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/Maintenance']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/StartMaintenance']);
    
end
if ~isFeatureInConf(configFileName, 'Emergency')
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/EmergencyButton']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/Switch']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/Switch1']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/Constant']);
    addLineSafe([simulinkConfigurationNameNoSLX '/Tank/Control/Multiport Switch'], 1, ...
        [simulinkConfigurationNameNoSLX '/Tank/Control/LiquidIn'], 1 );
    addLineSafe([simulinkConfigurationNameNoSLX '/Tank/Control/Multiport Switch1'], 1, ...
        [simulinkConfigurationNameNoSLX '/Tank/Control/LiquidOut'], 1 );
end
if ~isFeatureInConf(configFileName, 'Automatic')
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/AutomaticReference']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/AutomaticControlReference']);
   
end
if ~isFeatureInConf(configFileName, 'Manual')
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/ManualControlLiquidInOut']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/Fill']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Control/Empty']);
end
if ~isFeatureInConf(configFileName, 'Alarm')
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Alarm']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Tank_Model/Alarm']);
    deleteBlock([simulinkConfigurationNameNoSLX '/Tank/Tank_Model/Alarm_Control']);
end


AlarmLevel_NF = 12; %Numerical feature

