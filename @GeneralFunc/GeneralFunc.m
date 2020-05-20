classdef GeneralFunc
    methods (Static = true)
        EnvSettingCheck = EnvSetting();
        PresetVariables(app);
        
        UpdateCSVMaskTable(app,event);
        EffectiveMaskPreview(app, event);
        UpdateEffectiveMask(app, event);
        MaskGenerator(app,event);
        MaskGenPreview(app,event);
        
        ImageProfileConfig(app,event);
        
        UpdateExpCondTableFromMasterInfo(app, event);
        UpdateMasterInfoFromTable(app, event);
        UpdateDataSheetSelectionItems(app, event);
        
        UpdateDataStorageTable(app,event);
        
        DataProcess(app,event);
        
        PlotCurrentImage(app,event);
        PlotCurrentProfile(app,event);
        PlotStoredProfile(app,event);
        
        MessageControl(app,event,Message,Mode);
        
        BusyControl(app,event,Status);
    end
end