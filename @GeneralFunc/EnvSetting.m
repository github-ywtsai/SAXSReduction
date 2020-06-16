function EnvSettingCheck = EnvSetting()
EnvSettingCheck = true;
return
if ispc
    OS = 'PC';
elseif isunix
    OS = 'UNIX';
elseif ismac
    OS = 'MAC';
end

switch OS
    case 'PC'
        DLLPATH = fullfile(pwd,'./@EigerDataFunc');
        cmd = sprintf('setx HDF5_PLUGIN_PATH "%s', DLLPATH);
        HDF5PLUGINPATH = getenv('HDF5_PLUGIN_PATH');
        
        if ~isempty(HDF5PLUGINPATH)
            HDF5PLUGINPATH = fullfile(HDF5PLUGINPATH);
            if ~strcmpi(HDF5PLUGINPATH,DLLPATH)
                system(cmd);
                disp('Environment variables are arranged.')
                disp('Please restart Matlab.')
                EnvSettingCheck = false;
            else
                EnvSettingCheck = true;
            end
        else
            system(cmd);
            disp('Environment variables are arranged.')
            disp('Please restart Matlab.')
            EnvSettingCheck = false;
        end
    case 'UNIX'
        disp('Environment variables must be configured manually in UNIX.')
        disp('The Environment checking is bypassed.')
        EnvSettingCheck = true;
    case 'MAC'
        disp('Environment variables must be configured manually in MAC.')
        disp('The Environment checking is bypassed.')
        EnvSettingCheck = true;
end