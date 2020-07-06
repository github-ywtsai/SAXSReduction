function UpdateDataStorageTable(app,event)

% Table part

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

% dropdown for offset part

EmptyIdx = cellfun(@(X)isempty(X),Name);
DropDownItems = Name;
DropDownItems(EmptyIdx) = [];
StoredIdx = find(~EmptyIdx);
if ~isempty(StoredIdx)
    for SN = 1:length(DropDownItems)
        DropDownItems{SN} = sprintf('%d. %s',StoredIdx(SN),DropDownItems{SN});
    end
end
DropDownItems = [{'None'};DropDownItems];
DropDownItemsData = [0;StoredIdx];
app.TargetStoredDataDropDown.Items = DropDownItems;
app.TargetStoredDataDropDown.ItemsData = DropDownItemsData;
UserCallback.StoredDataOffsetMagControl(app,event);
    