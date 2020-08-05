function SingleDataProcess(app,event)

app.CurrentData.SampleTrans = app.SampleTransEditField.Value;
app.CurrentData.BufferTrans = app.BufferTransEditField.Value;
DataPackage = app.CurrentData;
if app.SaturationEliminationCheckBox.Value
    EffectiveMask = DataPackage.EffectiveMask;
    BadPointValue = single(DataPackage.MasterInfo.BadPointValue);
    RawData = DataPackage.RawData;
    BadPointMask = logical((RawData == BadPointValue).*~EffectiveMask);
    if ~any(BadPointMask)
        % No saturated point, do nothing.
    else
        DataPackage.RawData = GeneralFunc.SaturatedPointElimination(RawData,BadPointMask);
    end
end
[ImageForDrawing,ProfileForDrawing] = GeneralFunc.DataProcessCore(DataPackage);
app.CurrentData.ImageForDrawing = ImageForDrawing;
app.CurrentData.ProfileForDrawing = ProfileForDrawing;
