function DataSheetSelect(app,event)

event.Source

app.CurrentData.RequestSN = app.CurrentDataSheetSpinner.Value;
app.CurrentData.RawData = double(EigerDataFunc.ReadEigerHDF5Data(app.CurrentData.MasterInfo,app.CurrentData.RequestSN,[],[]));

GeneralFunc.PlotCurrentImage(app,event);
