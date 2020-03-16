function PresetVariables(app)

app.CurrentData = [];
app.CurrentData.MasterInfo = [];
app.CurrentData.DefaultMasterInfo = [];
app.CurrentData.UserDefineMasterInfo = [];

app.CurrentData.MaskInfo = [];
app.CurrentData.MaskInfo.EffectiveMask = [];
app.CurrentData.MaskInfo.MaskPool = cell(10,1);

app.MaskGen = [];
app.MaskGen.MaskPreview = [];
BuildingMaskGenTable(app);

function BuildingMaskGenTable(app)
Parameters = {'Min.';'Max.';'Center angle (deg.)';'Sweeping angle (deg.)'};
Values = {0;1;90;20};
app.RadiusMaskGenUITable.Data = [Parameters,Values];

