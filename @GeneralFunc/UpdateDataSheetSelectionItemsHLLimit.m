function UpdateDataSheetSelectionItemsHLLimit(app, event)

% Spinner part
app.CurrentDataSheetSpinner.Value = 1;

if app.CurrentData.MasterInfo.DataSheetNum == 1
    app.CurrentDataSheetSpinner.Enable = 'off';
else
    app.CurrentDataSheetSpinner.Enable = 'on';
    app.CurrentDataSheetSpinner.Limits = double([1 app.CurrentData.MasterInfo.DataSheetNum]);
end

% Average part
if app.CurrentData.MasterInfo.DataSheetNum == 1
    app.AvgDataStartSNEditField.Enable = 'off';
    app.AvgDataIncrementEditField.Enable = 'off';
    app.AvgDataEndSNEditField.Enable = 'off';
    app.AvgDataSkipSNEditField.Enable = 'off';
else
    app.AvgDataStartSNEditField.Enable = 'on';
    app.AvgDataIncrementEditField.Enable = 'on';
    app.AvgDataEndSNEditField.Enable = 'on';
    app.AvgDataSkipSNEditField.Enable = 'on';
    app.AvgDataStartSNEditField.Limits = double([1 app.CurrentData.MasterInfo.DataSheetNum]);
    app.AvgDataEndSNEditField.Limits = double([1 app.CurrentData.MasterInfo.DataSheetNum]);
end