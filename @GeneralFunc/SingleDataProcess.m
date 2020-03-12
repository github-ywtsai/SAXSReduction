function SingleDataProcess(app,event)

RawData = app.CurrentData.RawData;

if isempty(app.CurrentData.MaskInfo.EffectiveMask)
    app.CurrentData.MaskedData = RawData;
else
    app.CurrentData.MaskedData = RawData.* ~app.CurrentData.MaskInfo.EffectiveMask;
end
