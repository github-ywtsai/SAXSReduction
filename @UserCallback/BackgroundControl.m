function BackgroundControl(app,event)
if event.Source == app.SaveCurrentDataAsBackgroundButton
    AddBackground(app,event);
elseif event.Source == app.BGDrawButton
    DrawBackground(app,event);
elseif event.Source == app.BGRemoveButton
    RemoveBackground(app,event);
elseif event.Source == app.BGSetButton
    SetBackground(app,event);
end

TransportBGtoCurrentData(app,event);

if isempty(app.BGInfo.Background)
else
    app.BGInfo.Background.SampleTrans = app.SampleTransEditField.Value;
    app.BGInfo.Background.BufferTrans = app.BufferTransEditField.Value; 
end

UpdataDroplistItems(app,event);

if event.Source == app.BGSetButton || event.Source == app.SampleTransEditField || event.Source == app.BufferTransEditField
    GeneralFunc.SingleDataProcess(app,event);
    GeneralFunc.PlotCurrentProfile(app,event);
    GeneralFunc.PlotCurrentImage(app,event);
end

function AddBackground(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);
app.BGInfo.BackgroundPool{BGID}.Background = app.CurrentData.RawData;
app.BGInfo.BackgroundPool{BGID}.BackgroundCT = app.CurrentData.MasterInfo.CountTime;
app.BGInfo.BackgroundPool{BGID}.BackgroundAveragedDataSheetNum = app.CurrentData.MasterInfo.AveragedDataSheetNum;
app.BGInfo.BackgroundPool{BGID}.Active = false;
app.BGInfo.BackgroundPool{BGID}.Title = app.CurrentData.Title;

function DrawBackground(app,event)

function RemoveBackground(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);
app.BGInfo.BackgroundPool{BGID} = [];

function SetBackground(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);
if isempty(app.BGInfo.BackgroundPool{BGID})
    return
else
    CurrentBGIDStatus = app.BGInfo.BackgroundPool{BGID}.Active;
    for BGIdx = 1:10
        if ~isempty(app.BGInfo.BackgroundPool{BGIdx})
            app.BGInfo.BackgroundPool{BGIdx}.Active = false;
        end
    end
    app.BGInfo.BackgroundPool{BGID}.Active = ~CurrentBGIDStatus;
end

function UpdataDroplistItems(app,event)
Items = cell(1,10);
for BGID = 1:10
    if isempty(app.BGInfo.BackgroundPool{BGID})
        Items{BGID} = sprintf('%d.',BGID);
    else
        if app.BGInfo.BackgroundPool{BGID}.Active
            Items{BGID} = sprintf('SET %d. %s',BGID,app.BGInfo.BackgroundPool{BGID}.Title);
        else
            Items{BGID} = sprintf('%d. %s',BGID,app.BGInfo.BackgroundPool{BGID}.Title);
        end
    end
end
app.BackgroundIDDropDown.Items = Items;

function TransportBGtoCurrentData(app,event)
app.CurrentData.Background = [];
app.CurrentData.BackgroundCT = [];
app.CurrentData.BackgroundAveragedDataSheetNum = [];
for BGID = 1:10
    if isempty(app.BGInfo.BackgroundPool{BGID})
    else
        if app.BGInfo.BackgroundPool{BGID}.Active
            app.CurrentData.Background = app.BGInfo.BackgroundPool{BGID}.Background;
            app.CurrentData.BackgroundCT = app.BGInfo.BackgroundPool{BGID}.BackgroundCT;
            app.CurrentData.BackgroundAveragedDataSheetNum = app.BGInfo.BackgroundPool{BGID}.BackgroundAveragedDataSheetNum;
        end
    end
end
