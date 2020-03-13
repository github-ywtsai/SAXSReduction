classdef GeneralFunc
    methods (Static = true)
        PresetVariables(app);
        
        UpdateCSVMaskTable(app,event);
        EffectiveMaskPreview(app, event);
        UpdateEffectiveMask(app, event);
        
        ImageProfileConfig(app,event);
        
        UpdateExpCondTableFromMasterInfo(app, event);
        UpdateMasterInfoFromTable(app, event);
        UpdateDataSheetSelectionItems(app, event);
        
        SingleDataProcess(app,event);
        
        PlotCurrentImage(app,event);
        PlotCurrentProfile(app,event);
    end
end