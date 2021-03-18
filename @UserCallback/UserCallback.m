classdef UserCallback
    methods (Static = true)
        MainTabSelection(app,event);
        
        EigerMasterImport(app,event);
        CSVMaskControl(app, event);
        EffectiveMaskControl(app,event);
        EffectiveMaskSelection(app,event)
        ExportCSVMask(app, event);
        
        DataSheetSelect(app,event);
        AverageData(app,event);
        PlotMultiDataSheet(app,event);
        ProfileAxesControl(app,event);

        
        BackgroundControl(app,event);
        
        StoredDataSelection(app,event);
        DataStorageControl(app,event);
        StoredDataControl(app,event)
        StoredDataOffsetMagControl(app,event);
        
        ExportCurrentProfile(app,event);
        ExportCurrentImage(app,event);
        ExportSelectedProfile(app,event);
        ExportAll2mat(app,event);
        
        ImgAppearanceControl(app,event);
    end
end