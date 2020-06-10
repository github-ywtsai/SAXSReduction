classdef UserCallback
    methods (Static = true)
        EigerMasterImport(app,event);
        CSVMaskControl(app, event);
        EffectiveMaskControl(app,event);
        EffectiveMaskSelection(app,event)
        ExportCSVMask(app, event);
        
        DataSheetSelect(app,event);
        AverageData(app,event);
        
        BackgroundControl(app,event);
        
        StoredDataSelection(app,event);
        DataStorageControl(app,event);
        StoredDataOffsetMagChanged(app,event);
        
        ExportCurrentProfile(app,event);
        ExportAll2mat(app,event);
    end
end