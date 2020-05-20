function DataSheetSelect(app,event)
GeneralFunc.BusyControl(app,event,true)

if event.Source == app.CurrentDataSheetSpinner
    SourceItem = 'Spinner';
elseif event.Source == app.EigerMasterMenu
    SourceItem = 'DataImport';
elseif event.Source == app.CurrentDataSheetReDrawButton
    SourceItem = 'CurrentDataSheetReDraw';
end

switch SourceItem
    case 'DataImport'
        app.CurrentData.RequestSN = app.CurrentDataSheetSpinner.Value;
    case 'Spinner'
        app.CurrentData.RequestSN = app.CurrentDataSheetSpinner.Value;
    case 'CurrentDataSheetReDraw'
        app.CurrentData.RequestSN = app.CurrentDataSheetSpinner.Value;
end

app.CurrentData.RawData = single(EigerDataFunc.ReadEigerHDF5Data(app.CurrentData.MasterInfo,app.CurrentData.RequestSN,[],[]));
[~,Title,~] = fileparts(app.CurrentData.MasterInfo.MasterFP); Title = strrep(Title,'_master','');
app.CurrentData.Title = sprintf('%s#%d',Title,app.CurrentData.RequestSN);
app.MasterInfo.AveragedDataSheetNum = 1;

GeneralFunc.DataProcess(app,event);
GeneralFunc.PlotCurrentProfile(app,event);
GeneralFunc.PlotCurrentImage(app,event);

GeneralFunc.BusyControl(app,event,false)