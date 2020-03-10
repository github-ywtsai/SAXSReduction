function UpdateDataSheetSelectionItems(app, event)

app.CurrentDataSheetSpinner.Value = 1;
app.CurrentDataSheetSpinner.Limits = double([1 app.CurrentData.MasterInfo.DataSheetNum]);