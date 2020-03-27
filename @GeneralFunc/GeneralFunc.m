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
        
        UpdateKeepedDataTable(app,event);
        
        DataProcess(app,event);
        
        PlotCurrentImage(app,event);
        PlotCurrentProfile(app,event);
        PlotKeepedProfile(app,event);
    end
end