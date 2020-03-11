function UpdateMasterInfoFromTable(app, event)

UserDefineData = app.ExpCondUITable.Data(:,4);
app.CurrentData.UserDefineMasterInfo.XPixelsInDetector = UserDefineData{1};
app.CurrentData.UserDefineMasterInfo.YPixelsInDetector = UserDefineData{2};
app.CurrentData.UserDefineMasterInfo.CountTime = UserDefineData{3};
app.CurrentData.UserDefineMasterInfo.DetectorDistance = UserDefineData{4};
app.CurrentData.UserDefineMasterInfo.XPixelSize = UserDefineData{5};
app.CurrentData.UserDefineMasterInfo.YPixelSize = UserDefineData{6};
app.CurrentData.UserDefineMasterInfo.Wavelength = UserDefineData{7};
app.CurrentData.UserDefineMasterInfo.BeamCenterX = UserDefineData{8};
app.CurrentData.UserDefineMasterInfo.BeamCenterY = UserDefineData{9};

if app.ParametersinProcessButtonGroup.SelectedObject == app.UserDefineButton
    app.CurrentData.MasterInfo = app.CurrentData.UserDefineMasterInfo;
elseif app.ParametersinProcessButtonGroup.SelectedObject == app.DefaultButton
    app.CurrentData.MasterInfo = app.CurrentData.DefaultMasterInfo;
end

GeneralFunc.UpdateExpCondTableFromMasterInfo(app,event);