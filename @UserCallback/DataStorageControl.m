function DataStorageControl(app,event)
if event.Source == app.StoreCurrentDataButton
    StoreData(app,event);
elseif event.Source == app.PlotSelectStoredDataButton
    PlotSelect(app,event);
elseif event.Source == app.RemoveStoredDataButton
    RemoveStoredData(app,event);
elseif event.Source == app.LoadDataButton
    LoadStoredData(app,event);
end

UpdateDropListItems(app, event);
GeneralFunc.UpdateDataStorageTable(app,event);


function StoreData(app,event)
KID = str2double(app.StoredDataIDDropDown.Value);
app.DataStorage{KID} = app.CurrentData;
app.DataStorage{KID}.Offset = 0;
app.DataStorage{KID}.Magnification = 1;


function RemoveStoredData(app,event)
KID = str2double(app.StoredDataIDDropDown.Value);
app.DataStorage{KID} = [];

function PlotSelect(app,event)
GeneralFunc.PlotStoredProfile(app,event);

function LoadStoredData(app,event)
KID = str2double(app.StoredDataIDDropDown.Value);
if isempty(app.DataStorage{KID})
else
    app.CurrentData = app.DataStorage{KID};
end
GeneralFunc.DataProcess(app,event);
GeneralFunc.PlotCurrentImage(app,event);
GeneralFunc.PlotCurrentProfile(app,event);


function UpdateDropListItems(app, event)
Items = cell(1,20);
for KID = 1:20
    if isempty(app.DataStorage{KID})
        Items{KID} = sprintf('%d.',KID);
    else
    Items{KID} = sprintf('%d. %s',KID,app.DataStorage{KID}.Title);
    end
end
app.StoredDataIDDropDown.Items = Items;