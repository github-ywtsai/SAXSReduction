function KeepedDataControl(app,event)
if event.Source == app.KeepCurrentDataButton
    KeepData(app,event);
elseif event.Source == app.PlotSelectKeepedDataButton
    PlotSelect(app,event);
elseif event.Source == app.RemoveKeepedDataButton
    RemoveKeepedData(app,event);
elseif event.Source == app.LoadDataButton
    LoadKeepedData(app,event);
end

UpdateDropListItems(app, event);
GeneralFunc.UpdateKeepedDataTable(app,event);


function KeepData(app,event)
KID = str2double(app.KeepedDataIDDropDown.Value);
app.KeepedData{KID} = app.CurrentData;
app.KeepedData{KID}.Offset = 0;
app.KeepedData{KID}.Magnification = 1;


function RemoveKeepedData(app,event)
KID = str2double(app.KeepedDataIDDropDown.Value);
app.KeepedData{KID} = [];

function PlotSelect(app,event)
GeneralFunc.PlotKeepedProfile(app,event);

function LoadKeepedData(app,event)
KID = str2double(app.KeepedDataIDDropDown.Value);
if isempty(app.KeepedData{KID})
else
    app.CurrentData = app.KeepedData{KID};
end
GeneralFunc.DataProcess(app,event);
GeneralFunc.PlotCurrentImage(app,event);
GeneralFunc.PlotCurrentProfile(app,event);


function UpdateDropListItems(app, event)
Items = cell(1,20);
for KID = 1:20
    if isempty(app.KeepedData{KID})
        Items{KID} = sprintf('%d.',KID);
    else
    Items{KID} = sprintf('%d. %s',KID,app.KeepedData{KID}.Title);
    end
end
app.KeepedDataIDDropDown.Items = Items;