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

FF = uigetdir();
if FF == 0
    return
end

SelectedNum = length(SelectedIdx);
for SN = 1:SelectedNum
    Title = app.DataStorage{SelectedIdx(SN)}.Title;
    FN = sprintf('%s.txt',Title);
    FP = fullfile(FF,FN);
    
    DataPackage = app.DataStorage{SelectedIdx(SN)};
    GeneralFunc.Export3ColsDataCore(FP,DataPackage);
    
    GeneralFunc.MessageControl(app,event,sprintf('Exported selected-profile to %s.',FN),'add');
end
