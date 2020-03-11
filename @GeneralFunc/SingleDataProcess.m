function SingleDataProcess(app,event)

RawData = app.CurrentData.RawData;
PixelMask = app.CurrentData.MasterInfo.PixelMask;


app.CurrentData.MaskedData = RawData.* ~PixelMask;
