classdef GeneralFunc
    methods (Static = true)
        EnvSettingCheck = EnvSetting();
        PresetVariables(app);
        
        UpdateCSVMaskTable(app,event);
        DrawEffectiveMaskPreview(app, event);
        UpdateEffectiveMask(app, event);
        MaskGenerator(app,event);
        MaskGenPreview(app,event);
        
        ImageProfileConfig(app,event);
        
        UpdateExpCondTableFromMasterInfo(app, event);
        UpdateMasterInfoFromTable(app, event);
        UpdateDataSheetSelectionItemsHLLimit(app, event);
        
        UpdateDataStorageTable(app,event);
        
        SingleDataProcess(app,event);
        ModifiedData = SaturatedPointElimination(RawData,BadPointMask);
        [ImageForDrawing,ProfileForDrawing] = DataProcessCore(DataPackage);
        
        PlotCurrentImage(app,event);
        PlotCurrentProfile(app,event);
        PlotStoredProfile(app,event);
        RealValue = ImgThresholdSliderValueConverter(SliderValue);
        
        MessageControl(app,event,Message,Mode);
        
        BusyControl(app,event,Status);
        
        I0List = LoadI0Normalizataion(app,event);
    end
end