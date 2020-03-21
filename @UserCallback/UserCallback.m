classdef UserCallback
    methods (Static = true)
        EigerMasterImport(app,event);
        CSVMaskControl(app, event);
        ExportCSVMask(app, event);
        
        DataSheetSelect(app,event);
        AverageData(app,event);
        
        BackgroundControl(app,event);
        
        ExportCurrentProfile(app,event);
    end
end