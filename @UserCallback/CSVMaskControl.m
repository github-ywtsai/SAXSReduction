function CSVMaskControl(app, event)
if event.Source == app.AddCSVMaskButton
    AddCSVMask(app,event);
elseif event.Source == app.RemoveCSVMaskButton
    RemoveCSVMask(app,event);
elseif event.Source == app.ActiveCSVMaskButton
    ActiveCSVMask(app,event);
elseif event.Source == app.InvertCSVMaskButton
    InvertCSVMask(app,event);
end

UpdateDropListItems(app, event);
GeneralFunc.UpdateCSVMaskTable(app,event);
GeneralFunc.UpdateEffectiveMask(app, event);
GeneralFunc.EffectiveMaskPreview(app, event);

function ActiveCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
if isempty(app.CurrentData.MaskInfo.MaskPool{CSVID})
    return
else
    app.CurrentData.MaskInfo.MaskPool{CSVID}.Active = ~app.CurrentData.MaskInfo.MaskPool{CSVID}.Active;
end

function InvertCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
if isempty(app.CurrentData.MaskInfo.MaskPool{CSVID})
    return
else
    app.CurrentData.MaskInfo.MaskPool{CSVID}.Inverse = ~app.CurrentData.MaskInfo.MaskPool{CSVID}.Inverse;
end
    

function UpdateDropListItems(app, event)
Items = cell(1,10);
for CSVID = 1:10
    if isempty(app.CurrentData.MaskInfo.MaskPool{CSVID})
        Items{CSVID} = sprintf('%d.',CSVID);
    else
    Items{CSVID} = sprintf('%d. %s',CSVID,app.CurrentData.MaskInfo.MaskPool{CSVID}.CSVFN);
    end
end
app.CSVMaskIDDropDown.Items = Items;

function RemoveCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
app.CurrentData.MaskInfo.MaskPool{CSVID} = [];

function AddCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
[CSVFN,CSVFF] = uigetfile('*.csv');
if CSVFN == 0
    return
else
    CSVFP = fullfile(CSVFF,CSVFN);
end
CSVData = LoadDataFromCSV(CSVFP);
Mask = CSVData2Matrix(CSVData,app.CurrentData.MasterInfo.YPixelsInDetector,app.CurrentData.MasterInfo.XPixelsInDetector);
app.CurrentData.MaskInfo.MaskPool{CSVID}.Mask = Mask;
app.CurrentData.MaskInfo.MaskPool{CSVID}.CSVFN = CSVFN;
app.CurrentData.MaskInfo.MaskPool{CSVID}.CSVFF = CSVFF;
app.CurrentData.MaskInfo.MaskPool{CSVID}.CSVFP = CSVFP;
app.CurrentData.MaskInfo.MaskPool{CSVID}.Active = true;
app.CurrentData.MaskInfo.MaskPool{CSVID}.Inverse = false;

function Mask = CSVData2Matrix(CSVData,RawSize,ColSize)
Mask = logical(accumarray(CSVData,1,[RawSize,ColSize]));

function CSVData = LoadDataFromCSV(CSVFP)
temp = importdata(CSVFP,',');
NumData = temp.data;
TextData = temp.textdata;

% 1:    CSV format difference using Tool/XY coordininate in different imageJ version
%       New imageJ
%       Col_1:x; Col_2:y; Col_3;value
%       early imageJ
%       Col_1:idx; Col_2:x; Col_3:y; Col_4: value
% 2:    x(col) and y(row) indice start from 0 in imageJ but 1 from Matlab 
if strcmpi(TextData{1},'X') && strcmpi(TextData{2},'Y') && strcmpi(TextData{3},'Value')
    CSVData = fliplr(NumData(:,1:2)+1); % fliplr to change the sequency from x/y to y/x to match the matlab rule [rowidx, colidx]
else
    CSVData = fliplr(NumData(:,2:3)+1); % fliplr to change the sequency from x/y to y/x to match the matlab rule [rowidx, colidx]
end
