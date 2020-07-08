function ExportSelectedProfile(app,event)

EmptyList = false(20,1);

for KID = 1:20
    EmptyList(KID) = isempty(app.DataStorage{KID});
end
% Modeifiy the selected items to unselect when the slots are empty. 
SelectedList = cell2mat(app.DataStorageUITable.Data(:,1));
SelectedList(EmptyList) = false;
% app.DataStorageUITable.Data(:,1) = num2cell(SelectedList);

SelectedIdx = find(SelectedList);
if isempty(SelectedIdx)
    return
end

SelectedNum = length(SelectedIdx);
Profile = cell(1,SelectedNum);
DataLength = zeros(1,SelectedNum);
for SN = 1:SelectedNum
    Profile{SN} = app.DataStorage{SelectedIdx(SN)}.ProfileForDrawing;
    DataLength(SN) =size(Profile{SN},2);
end
DataLengthMax = max(DataLength);
CellProfile = cell(DataLengthMax,SelectedNum*3);

for SN = 1:SelectedNum
    CellBuff = num2cell(transpose(Profile{SN}));
    CellProfile(1:DataLength(SN),(1:3)+3*(SN-1)) = CellBuff;
end

writecell(CellProfile,'multi-profile-test.txt','FileType','text','Delimiter','\t')
