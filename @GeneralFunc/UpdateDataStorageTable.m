function UpdateDataStorageTable(app,event)

Name = cell(20,1);
if isempty(app.DataStorageUITable.Data)
    Selected = num2cell(false(20,1));
else
    Selected = app.DataStorageUITable.Data(:,1);
end

for KeepedDataID =  1:20
    if isempty(app.DataStorage{KeepedDataID})
        Name{KeepedDataID} = [];
    else
        Name{KeepedDataID} = app.DataStorage{KeepedDataID}.Title;
    end
end

app.DataStorageUITable.Data = [Selected,Name];