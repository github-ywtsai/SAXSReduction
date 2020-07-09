function SingleDataProcess(app,event)

app.CurrentData.SampleTrans = app.SampleTransEditField.Value;
app.CurrentData.BufferTrans = app.BufferTransEditField.Value;
[ImageForDrawing,ProfileForDrawing] = GeneralFunc.DataProcessCore(app.CurrentData);
app.CurrentData.ImageForDrawing = ImageForDrawing;
app.CurrentData.ProfileForDrawing = ProfileForDrawing;
