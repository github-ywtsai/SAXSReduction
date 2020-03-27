function UpdateKeepedDataTable(app,event)

Name = cell(20,1);
if isempty(app.DataKeepedListUITable.Data)
    Selected = num2cell(false(20,1));
else
    Selected = app.DataKeepedListUITable.Data(:,1);
end

for KeepedDataID =  1:20
    if isempty(app.KeepedData{KeepedDataID})
        Name{KeepedDataID} = [];
    else
        Name{KeepedDataID} = app.KeepedData{KeepedDataID}.Title;
    end
end

app.DataKeepedListUITable.Data = [Selected,Name];