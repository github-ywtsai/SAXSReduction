function UpdateMasterInfoFromTable(app, event)

UserDefineData = app.ExpCondUITable.Data(:,4);
app.MasterInfo.UserDefine.XPixelsInDetector = UserDefineData{1};
app.MasterInfo.UserDefine.YPixelsInDetector = UserDefineData{2};
app.MasterInfo.UserDefine.CountTime = UserDefineData{3};
app.MasterInfo.UserDefine.DetectorDistance = UserDefineData{4};
app.MasterInfo.UserDefine.XPixelSize = UserDefineData{5};
app.MasterInfo.UserDefine.YPixelSize = UserDefineData{6};
app.MasterInfo.UserDefine.Wavelength = UserDefineData{7};
app.MasterInfo.UserDefine.BeamCenterX = UserDefineData{8};
app.MasterInfo.UserDefine.BeamCenterY = UserDefineData{9};

if app.ParametersinProcessButtonGroup.SelectedObject == app.UserDefineButton
    app.CurrentData.MasterInfo = app.MasterInfo.UserDefine;
elseif app.ParametersinProcessButtonGroup.SelectedObject == app.DefaultButton
    app.CurrentData.MasterInfo = app.MasterInfo.Default;
end

GeneralFunc.UpdateExpCondTableFromMasterInfo(app,event);