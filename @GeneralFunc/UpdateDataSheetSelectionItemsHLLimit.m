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
    app.MultiDataStartSNEditField.Enable = 'off';
    app.MultiDataIncrementEditField.Enable = 'off';
    app.MultiDataEndSNEditField.Enable = 'off';
    app.MultiDataSkipSNEditField.Enable = 'off';
else
    app.MultiDataStartSNEditField.Enable = 'on';
    app.MultiDataIncrementEditField.Enable = 'on';
    app.MultiDataEndSNEditField.Enable = 'on';
    app.MultiDataSkipSNEditField.Enable = 'on';
    app.MultiDataStartSNEditField.Limits = double([1 app.CurrentData.MasterInfo.DataSheetNum]);
    app.MultiDataEndSNEditField.Limits = double([1 app.CurrentData.MasterInfo.DataSheetNum]);
end