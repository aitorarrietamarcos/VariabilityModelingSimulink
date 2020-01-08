function isFeature = isFeatureInConf(configurationFile,feature)
    conf = read_configuration(configurationFile);
    isFeature = false;
    i = 1;
    while isFeature == false && size(conf,2) > i
       if strcmp(conf{1,i},feature)
           isFeature = true;
       end
       i=i+1;
    end

end