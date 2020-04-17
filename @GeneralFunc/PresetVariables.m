function PresetVariables(app)

app.CurrentData = [];
app.CurrentData.RawData = [];
app.CurrentData.Background = []; % current background
app.CurrentData.BackgroundCT = [];
app.CurrentData.SampleTrans = [];
app.CurrentData.BufferTrans = [];

app.MasterInfo = [];
app.MasterInfo.Default = [];
app.MasterInfo.UserDefine = [];

app.MaskInfo = [];
app.MaskInfo.EffectiveMask = []; % current effective mask
app.MaskInfo.MaskPool = cell(10,1);

app.BGInfo.Background = []; % current background
app.BGInfo.BackgroundCT = [];
app.BGInfo.SampleTrans = [];
app.BGInfo.BufferTrans = [];
app.BGInfo.BackgroundPool = cell(10,1);

app.MaskGen = [];
app.MaskGen.MaskPreview = [];
BuildingMaskGenTable(app);

app.DataStorage = cell(20,1);


function BuildingMaskGenTable(app)
Parameters = {'Min.';'Max.';'Center angle (deg.)';'Sweeping angle (deg.)'};
Values = {0;1;90;20};
app.RadiusMaskGenUITable.Data = [Parameters,Values];