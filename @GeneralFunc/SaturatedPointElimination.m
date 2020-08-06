function DataPackage = SaturatedPointElimination(app,event,DataPackage)

if app.SaturationEliminationCheckBox.Value
    EffectiveMask = DataPackage.EffectiveMask;
    BadPointValue = single(DataPackage.MasterInfo.BadPointValue);
    RawData = DataPackage.RawData;
    BadPointMask = logical((RawData >= BadPointValue).*~EffectiveMask);
    if ~any(BadPointMask)
        % do nothing
    else
        RawData(BadPointMask) = 0;
        DataPackage.RawData = RawData;
    end
end