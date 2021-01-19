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
app.AdditionalInfo.MaskPoolNum = 10;
app.MaskInfo.MaskPool = cell(app.AdditionalInfo.MaskPoolNum,1);
app.MaskInfo.EffectiveMaskPool = [];

app.BGInfo.Background = []; % current background
app.BGInfo.BackgroundCT = [];
app.BGInfo.SampleTrans = [];
app.BGInfo.BufferTrans = [];
app.BGInfo.BackgroundPool = [];

app.MaskGen = [];
app.MaskGen.MaskPreview = [];
BuildingMaskGenTable(app);

app.AdditionalInfo.DataStorageNum = 30;
app.DataStorage = cell(app.AdditionalInfo.DataStorageNum,1);
app.DataStorageUITable.ColumnFormat = {'logical',{'Cancel','Store Current Data','Remove','Restore Stored Data','Clear All Storages'}};

app.AdditionalInfo.ColormapAlbula = GenAlbulaColormap();

function BuildingMaskGenTable(app)
% for radius
Parameters = {'Min.';'Max.';'Start angle (deg.)';'End angle (deg.)'};
Values = {0;1;40;80};
app.RadiusMaskGenUITable.Data = [Parameters,Values];
% for rectangle
Parameters = {'qr Min. (1/A)';'qr Max. (1/A)';'qzMin (1/A)';'qzMax (1/A)'};
Values = {-1.2;0.5;0.5;1};
app.RectangleMaskGenUITable.Data = [Parameters,Values];


function Albula = GenAlbulaColormap()
HotColormap = hot(2^8);
HotR = HotColormap(:,1);
HotG = HotColormap(:,2);
HotB = HotColormap(:,3);

P1 = 80;

R1 = linspace(1,0,P1)';
G1 = R1;
B1 = R1;

D2B = (0:255)';

R2 = interp1(D2B,HotR,linspace(0,255,256-P1)');
G2 = interp1(D2B,HotG,linspace(0,255,256-P1)');
B2 = interp1(D2B,HotB,linspace(0,255,256-P1)');

R = [R1;R2];
G = [G1;G2];
B = [B1;B2];

Albula = [R G B];


