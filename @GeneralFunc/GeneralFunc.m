classdef GeneralFunc
    methods (Static = true)
        PresetVariables(app);
        
        UpdateCSVMaskTable(app,event);
        DrawEffectiveMaskPreview(app, event);
        UpdateEffectiveMask(app, event);
        UpdateEffectiveMaskTable(app,event);
        MaskGenerator(app,event);
        MaskGenPreview(app,event);
        
        ImageProfileConfig(app,event);
        
        UpdateExpCondTableFromMasterInfo(app, event);
        UpdateMasterInfoFromTable(app, event);
        UpdateDataSheetSelectionItemsHLLimit(app, event);
        
        UpdateDataStorageTable(app,event);
        StoredProfileOperation(app,event);
        
        SingleDataProcess(app,event);
        DataPackage = SaturatedPointElimination(app,event,DataPackage);
        [ImageForDrawing,ProfileForDrawing] = DataProcessCore(DataPackage);
        
        PlotCurrentImage(app,event);
        PlotCurrentProfile(app,event);
        PlotStoredProfile(app,event);
        RealValue = ImgThresholdSliderValueConverter(SliderValue);
        
        MessageControl(app,event,Message,Mode);
        
        BusyControl(app,event,Status);
        
        I0List = LoadI0Normalizataion(app,event);
        
        Export3ColsDataCore(FP,DataPackage);
    end
end