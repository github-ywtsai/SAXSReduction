function DataStorageControl(app,event)
KID = event.Indices(1);
ColIdx = event.Indices(2);

switch ColIdx
    case 2 % add or remove
        switch event.EditData
            case 'Cancel'
            case 'Store Current Data'
                StoreData(app,event,KID);
            case 'Remove'
                RemoveStoredData(app,event,KID);
            case 'Restore Stored Data'
                RestoreData(app,event,KID);
            case 'Clear All Storages'
                ClearAll(app,event);
        end
end

%{
if event.Source == app.StoreCurrentDataButton
    StoreData(app,event,KID);
elseif event.Source == app.PlotSelectStoredDataButton
    PlotSelect(app,event);
elseif event.Source == app.RemoveStoredDataButton
    RemoveStoredData(app,event,KID);
elseif event.Source == app.LoadDataButton
    LoadStoredData(app,event,KID);
end
%}

GeneralFunc.UpdateDataStorageTable(app,event); % including update target stored data dropdown

function ClearAll(app,event)
NDataStorage = app.AdditionalInfo.DataStorageNum;
for SN = 1:NDataStorage
    app.DataStorage{SN} = [];
end

function StoreData(app,event,KID)
app.DataStorage{KID} = app.CurrentData;
app.DataStorage{KID}.Offset = 0;
app.DataStorage{KID}.Magnification = 1;


function RemoveStoredData(app,event,KID)
app.DataStorage{KID} = [];

function RestoreData(app,event,KID)
if isempty(app.DataStorage{KID})
else
    app.CurrentData = app.DataStorage{KID};
end
GeneralFunc.DataProcess(app,event);
GeneralFunc.PlotCurrentImage(app,event);
GeneralFunc.PlotCurrentProfile(app,event);