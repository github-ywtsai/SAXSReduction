function PlotStoredProfile(app,event)

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
LegendList = cell(1,SelectedNum);

LegendList{1} = sprintf('%d. %s',SelectedIdx(1) , app.DataStorage{SelectedIdx(1)}.Title);
Profile = app.DataStorage{SelectedIdx(1)}.ProfileForDrawing;
Offset = app.DataStorage{SelectedIdx(1)}.Offset;
Magnification = app.DataStorage{SelectedIdx(1)}.Magnification;
Profile(2,:) = Profile(2,:)*Magnification + Offset;
app.PlotHandles.MultiProfile = plot(app.MultiProfileUIAxes,Profile(1,:),Profile(2,:));
if SelectedNum > 1
    hold(app.MultiProfileUIAxes,'on')
    for Idx = 2:SelectedNum
        LegendList{Idx} = sprintf('%d. %s',SelectedIdx(Idx) , app.DataStorage{SelectedIdx(Idx)}.Title);
        Profile = app.DataStorage{SelectedIdx(Idx)}.ProfileForDrawing;
        Offset = app.DataStorage{SelectedIdx(Idx)}.Offset;
        Magnification = app.DataStorage{SelectedIdx(Idx)}.Magnification;
        Profile(2,:) = Profile(2,:)*Magnification + Offset;
        app.PlotHandles.MultiProfile = plot(app.MultiProfileUIAxes,Profile(1,:),Profile(2,:));
    end
    hold(app.MultiProfileUIAxes,'off')
end
legend(app.MultiProfileUIAxes, LegendList,'interpreter', 'none')

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

app.TabGroup.SelectedTab = app.MultiProfileTab;