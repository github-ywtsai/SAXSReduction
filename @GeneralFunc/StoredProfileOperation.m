function StoredProfileOperation(app,OPMode)
if strcmpi(OPMode,'Export')
    FF = uigetdir();
    if FF == 0
        return
    end
elseif  strcmpi(OPMode,'Plot')
end

DataStorageNum = app.AdditionalInfo.DataStorageNum;
EmptyList = false(DataStorageNum,1);

for KID = 1:DataStorageNum
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
LegendList = cell(1,SelectedNum);
cla(app.MultiProfileUIAxes);
if app.MultiProfileXAxisScaleButtonGroup.SelectedObject == app.MultiProfileXAxisLogButton
    app.MultiProfileUIAxes.XScale = 'log';
else
    app.MultiProfileUIAxes.XScale = 'linear';
end

if app.MultiProfileYAxisScaleButtonGroup.SelectedObject == app.MultiProfileYAxisLogButton
    app.MultiProfileUIAxes.YScale = 'log';
else
    app.MultiProfileUIAxes.YScale = 'linear';
end
app.MainTabGroup.SelectedTab = app.MultiProfileTab;
hold(app.MultiProfileUIAxes,'on')
for Idx = 1:SelectedNum
    
    LegendList{Idx} = sprintf('%d. %s',SelectedIdx(Idx) , app.DataStorage{SelectedIdx(Idx)}.Title);
    Profile = app.DataStorage{SelectedIdx(Idx)}.ProfileForDrawing;
    Offset = app.DataStorage{SelectedIdx(Idx)}.Offset;
    Magnification = app.DataStorage{SelectedIdx(Idx)}.Magnification;
    Profile(2,:) = Profile(2,:)*Magnification + Offset;
    app.PlotHandles.MultiProfile = plot(app.MultiProfileUIAxes,Profile(1,:),Profile(2,:));
    
    if strcmpi(OPMode,'Export')
        Title = app.DataStorage{SelectedIdx(Idx)}.Title;
        FN = sprintf('%s.txt',Title);
        FP = fullfile(FF,FN);
        DataPackage = app.DataStorage{SelectedIdx(Idx)};
        GeneralFunc.Export3ColsDataCore(FP,DataPackage);
    
        GeneralFunc.MessageControl(app,[],sprintf('Exported selected-profile to %s.',FN),'add');
    end
end
hold(app.MultiProfileUIAxes,'off')
legend(app.MultiProfileUIAxes, LegendList,'interpreter', 'none')