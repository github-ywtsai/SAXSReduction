function BackgroundControl(app,event)
if event.Source == app.SaveCurrentDataAsBackgroundButton
    AddBackground(app,event);
elseif event.Source == app.BGDrawButton
    DrawBackground(app,event);
elseif event.Source == app.BGRemoveButton
    RemoveBackground(app,event);
elseif event.Source == app.BackgroundIDDropDown
end

UpdataDroplistItems(app,event);

TransportBGtoCurrentData(app,event);

GeneralFunc.SingleDataProcess(app,event);
GeneralFunc.PlotCurrentProfile(app,event);
GeneralFunc.PlotCurrentImage(app,event);


function AddBackground(app,event)

if isempty(app.BGInfo.BackgroundPool)
    BGID = 1;
else
    BGID = numel(app.BGInfo.BackgroundPool) + 1;
end

app.BGInfo.BackgroundPool{BGID}.Background = app.CurrentData.RawData;
app.BGInfo.BackgroundPool{BGID}.BackgroundCT = app.CurrentData.MasterInfo.CountTime;
app.BGInfo.BackgroundPool{BGID}.BackgroundAveragedDataSheetNum = app.CurrentData.MasterInfo.AveragedDataSheetNum;
app.BGInfo.BackgroundPool{BGID}.Title = app.CurrentData.Title;

function DrawBackground(app,event)

function RemoveBackground(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);
if BGID == 0
    return
end
app.BGInfo.BackgroundPool(BGID) = [];
app.BackgroundIDDropDown.Value = '0';

function UpdataDroplistItems(app,event)
BGPoolNum = numel(app.BGInfo.BackgroundPool);
Items = cell(1,BGPoolNum);
ItemsData = cell(1,BGPoolNum);

for BGID = 1:BGPoolNum
Items{BGID} = sprintf('%d. %s',BGID,app.BGInfo.BackgroundPool{BGID}.Title);
ItemsData{BGID} = num2str(BGID);
end
Items = [{'None'} Items];
ItemsData = [{'0'} ItemsData];

app.BackgroundIDDropDown.Items = Items;
app.BackgroundIDDropDown.ItemsData = ItemsData;

function TransportBGtoCurrentData(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);

if BGID == 0
    app.CurrentData.Background = [];
    app.CurrentData.BackgroundCT = [];
    app.CurrentData.BackgroundAveragedDataSheetNum = [];
else
    app.CurrentData.Background = app.BGInfo.BackgroundPool{BGID}.Background;
    app.CurrentData.BackgroundCT = app.BGInfo.BackgroundPool{BGID}.BackgroundCT;
    app.CurrentData.BackgroundAveragedDataSheetNum = app.BGInfo.BackgroundPool{BGID}.BackgroundAveragedDataSheetNum;
end
