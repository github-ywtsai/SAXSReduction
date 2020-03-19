function EnvSettingCheck = EnvSetting()
    DLLPATH = fullfile(pwd,'./@EigerDataFunc');
    cmd = sprintf('setx HDF5_PLUGIN_PATH "%s', DLLPATH);
    HDF5PLUGINPATH = getenv('HDF5_PLUGIN_PATH');
    
    if ~isempty(HDF5PLUGINPATH)
        HDF5PLUGINPATH = fullfile(HDF5PLUGINPATH);
        if ~strcmpi(HDF5PLUGINPATH,DLLPATH)
            system(cmd);
            disp('Enviroment variables arranged.')
            disp('Please restart Matlab.')
            EnvSettingCheck = false;
        else
            EnvSettingCheck = true;
        end 
    else
        system(cmd);
        disp('Enviroment variables arranged.')
        disp('Please restart Matlab.')
        EnvSettingCheck = false;
    end
end