classdef UserCallback
    methods (Static = true)
        EigerMasterImport(app,event);
        CSVMaskControl(app, event);
        ExportCSVMask(app, event);
        
        DataSheetSelect(app,event);
        
        BackgroundControl(app,event);
    end
end