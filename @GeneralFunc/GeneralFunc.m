classdef GeneralFunc
    methods (Static = true)
        PresetVariables(app);
        
        UpdateExpCondTableFromMasterInfo(app, event);
        UpdateMasterInfoFromTable(app, event);
        UpdateDataSheetSelectionItems(app, event);
        
        PlotCurrentImage(app,event);
    end
end