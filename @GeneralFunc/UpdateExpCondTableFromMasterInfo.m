function UpdateExpCondTableFromMasterInfo(app, event)

Items = {'X Pixels in Detector';'Y Pixels in Detector';'Count Time';'Sample/Detector Distance';'X Pixel Size';'Y Pixel Size';'Wavelength';'Beam Center X';'Beam Center Y'};
CurrentSettingData = GenParaListFromMasterInfo(app.CurrentData.MasterInfo);
DefaultData = GenParaListFromMasterInfo(app.CurrentData.DefaultMasterInfo);
UserDefineData = GenParaListFromMasterInfo(app.CurrentData.UserDefineMasterInfo);

OverallData = [Items,CurrentSettingData,DefaultData,UserDefineData];

app.ExpCondUITable.Data = OverallData;

function Data = GenParaListFromMasterInfo(MasterInfo)
Data = cell(9,1);
Data{1} = MasterInfo.XPixelsInDetector;
Data{2} = MasterInfo.YPixelsInDetector;
Data{3} = MasterInfo.CountTime;
Data{4} = MasterInfo.DetectorDistance;
Data{5} = MasterInfo.XPixelSize;
Data{6} = MasterInfo.YPixelSize;
Data{7} = MasterInfo.Wavelength;
Data{8} = MasterInfo.BeamCenterX;
Data{9} = MasterInfo.BeamCenterY;

