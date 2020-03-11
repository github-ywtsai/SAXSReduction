function DataSheetSelect(app,event)

if event.Source == app.CurrentDataSheetSpinner
    SourceItem = 'Spinner';
end

switch SourceItem
    case 'Spinner'
        app.CurrentData.RequestSN = app.CurrentDataSheetSpinner.Value;
        app.CurrentData.RawData = double(EigerDataFunc.ReadEigerHDF5Data(app.CurrentData.MasterInfo,app.CurrentData.RequestSN,[],[]));
end

GeneralFunc.PlotCurrentImage(app,event);
