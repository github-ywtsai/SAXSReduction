function UpdateDataSheetSelectionItems(app, event)

app.CurrentDataSheetSpinner.Value = 1;

if app.CurrentData.MasterInfo.DataSheetNum == 1
    app.CurrentDataSheetSpinner.Visible = 'off';
else
    app.CurrentDataSheetSpinner.Visible = 'on';
    app.CurrentDataSheetSpinner.Limits = double([1 app.CurrentData.MasterInfo.DataSheetNum]);
end