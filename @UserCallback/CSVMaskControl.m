function CSVMaskControl(app, event)
if event.Source == app.AddCSVMaskButton
    AddCSVMask(app,event);
elseif event.Source == app.RemoveCSVMaskButton
    RemoveCSVMask(app,event);
elseif event.Source == app.ActiveCSVMaskButton
    ActiveCSVMask(app,event);
elseif event.Source == app.InvertCSVMaskButton
    InvertCSVMask(app,event);
elseif event.Source == app.CSVMaskUITable
    CSVID = event.Indices(1);
    app.CSVMaskIDDropDown.Value = num2str(CSVID);
    if isempty(app.MaskInfo.MaskPool{CSVID})
        app.CSVMaskUITable.Data{event.Indices(1),event.Indices(2)} = false;
        return
    end
    if strcmpi(event.EventName,'CellEdit')
        switch event.Indices(2)
            case 2 % for Active control
                app.MaskInfo.MaskPool{CSVID}.Active = ~app.MaskInfo.MaskPool{CSVID}.Active;
            case 3 % for Inverse control
                app.MaskInfo.MaskPool{CSVID}.Inverse = ~app.MaskInfo.MaskPool{CSVID}.Inverse;
        end
    end
end

UpdateDropListItems(app, event);
GeneralFunc.UpdateCSVMaskTable(app,event);
GeneralFunc.UpdateEffectiveMask(app, event);
GeneralFunc.EffectiveMaskPreview(app, event);

function AddCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
SearchFile = fullfile(app.AdditionalInfo.LastMaskImportFolder,'*.csv');
[CSVFN,CSVFF] = uigetfile(SearchFile);
if CSVFN == 0
    return
else
    app.AdditionalInfo.LastMaskImportFolder = CSVFF;
    CSVFP = fullfile(CSVFF,CSVFN);
end
CSVData = LoadDataFromCSV(CSVFP);
Mask = CSVData2Matrix(CSVData,app.CurrentData.MasterInfo.YPixelsInDetector,app.CurrentData.MasterInfo.XPixelsInDetector);
app.MaskInfo.MaskPool{CSVID}.Mask = Mask;
app.MaskInfo.MaskPool{CSVID}.CSVFN = CSVFN;
app.MaskInfo.MaskPool{CSVID}.CSVFF = CSVFF;
app.MaskInfo.MaskPool{CSVID}.CSVFP = CSVFP;
app.MaskInfo.MaskPool{CSVID}.Active = true;
app.MaskInfo.MaskPool{CSVID}.Inverse = false;

function RemoveCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
app.MaskInfo.MaskPool{CSVID} = [];

function ActiveCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
if isempty(app.MaskInfo.MaskPool{CSVID})
    return
else
    app.MaskInfo.MaskPool{CSVID}.Active = ~app.MaskInfo.MaskPool{CSVID}.Active;
end

function InvertCSVMask(app,event)
CSVID = str2double(app.CSVMaskIDDropDown.Value);
if isempty(app.MaskInfo.MaskPool{CSVID})
    return
else
    app.MaskInfo.MaskPool{CSVID}.Inverse = ~app.MaskInfo.MaskPool{CSVID}.Inverse;
end
    

function UpdateDropListItems(app, event)
Items = cell(1,10);
for CSVID = 1:10
    if isempty(app.MaskInfo.MaskPool{CSVID})
        Items{CSVID} = sprintf('%d.',CSVID);
    else
    Items{CSVID} = sprintf('%d. %s',CSVID,app.MaskInfo.MaskPool{CSVID}.CSVFN);
    end
end
app.CSVMaskIDDropDown.Items = Items;


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
