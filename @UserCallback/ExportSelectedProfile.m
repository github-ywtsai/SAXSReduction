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
for SN = 1:SelectedNum
    ProfileForDrawing = app.DataStorage{SelectedIdx(SN)}.ProfileForDrawing;
    Title = app.DataStorage{SelectedIdx(SN)}.Title;
    FN = sprintf('%s.txt',Title);
    fid = fopen(FN,'w');
    fprintf(fid,'    % .5f             % .5E             % .5E\n',(ProfileForDrawing));
    fclose(fid);
end
