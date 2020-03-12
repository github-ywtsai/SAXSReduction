classdef GeneralFunc
    methods (Static = true)
        PresetVariables(app);
        
        UpdateCSVMaskTable(app,event);
        EffectiveMaskPreview(app, event);
        UpdateEffectiveMask(app, event);
        
        UpdateExpCondTableFromMasterInfo(app, event);
        UpdateMasterInfoFromTable(app, event);
        UpdateDataSheetSelectionItems(app, event);
        
        SingleDataProcess(app,event);
        
        PlotCurrentImage(app,event);
    end
end