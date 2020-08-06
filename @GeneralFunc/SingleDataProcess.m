function SingleDataProcess(app,event)

app.CurrentData.SampleTrans = app.SampleTransEditField.Value;
app.CurrentData.BufferTrans = app.BufferTransEditField.Value;
DataPackage = app.CurrentData;
DataPackage = GeneralFunc.SaturatedPointElimination(app,event,DataPackage);
[ImageForDrawing,ProfileForDrawing] = GeneralFunc.DataProcessCore(DataPackage);
app.CurrentData.ImageForDrawing = ImageForDrawing;
app.CurrentData.ProfileForDrawing = ProfileForDrawing;
