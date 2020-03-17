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

ActiveBackground(app,event);

if isempty(app.BGInfo.Background)
else
    app.BGInfo.Background.SampleTrans = app.SampleTransEditField.Value;
    app.BGInfo.Background.BufferTrans = app.BufferTransEditField.Value; 
end

UpdataDroplistItems(app,event);

function ActiveBackground(app,event)
if isempty(app.BGInfo.ActiveSN)
else
    app.BGInfo.Background = app.BGInfo.BackgroundPool{app.BGInfo.ActiveSN};
end

function AddBackground(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);
app.BGInfo.BackgroundPool{BGID} = app.CurrentData;

function DrawBackground(app,event)

function RemoveBackground(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);
app.BGInfo.BackgroundPool{BGID} = [];
if app.BGInfo.ActiveSN == BGID
    app.BGInfo.ActiveSN = [];
    app.BGInfo.Background = [];
end

function SetBackground(app,event)
BGID = str2double(app.BackgroundIDDropDown.Value);
if app.BGInfo.ActiveSN == BGID
    app.BGInfo.Background = [];
    app.BGInfo.ActiveSN = [];
else
    app.BGInfo.Background = app.BGInfo.BackgroundPool{BGID};
    app.BGInfo.ActiveSN = BGID; 
end

function UpdataDroplistItems(app,event)
Items = cell(1,10);
for BGID = 1:10
    if isempty(app.BGInfo.BackgroundPool{BGID})
        Items{BGID} = sprintf('%d.',BGID);
    else
        if BGID == app.BGInfo.ActiveSN
            Items{BGID} = sprintf('SET %d. %s',BGID,app.BGInfo.BackgroundPool{BGID}.Title);
        else
            Items{BGID} = sprintf('%d. %s',BGID,app.BGInfo.BackgroundPool{BGID}.Title);
        end
    end
end
app.BackgroundIDDropDown.Items = Items;
