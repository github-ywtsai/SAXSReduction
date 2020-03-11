function DataSheetSelect(app,event)

if event.Source == app.CurrentDataSheetSpinner
    SourceItem = 'Spinner';
elseif event.Source == app.EigerMasterMenu
    SourceItem = 'DataImport';
end

switch SourceItem
    case 'DataImport'
        app.CurrentData.RequestSN = app.CurrentDataSheetSpinner.Value;
    case 'Spinner'
        app.CurrentData.RequestSN = app.CurrentDataSheetSpinner.Value;
end

app.CurrentData.RawData = double(EigerDataFunc.ReadEigerHDF5Data(app.CurrentData.MasterInfo,app.CurrentData.RequestSN,[],[]));
GeneralFunc.SingleDataProcess(app,event);
GeneralFunc.PlotCurrentImage(app,event);
