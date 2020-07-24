function CSVMaskControl(app, event)
CSVID = event.Indices(1);
if isempty(app.MaskInfo.MaskPool{CSVID})
    app.CSVMaskUITable.Data{event.Indices(1),event.Indices(2)} = false;
end
if strcmpi(event.EventName,'CellEdit')
    switch event.Indices(2)
        case 1 % for add or remove
            switch event.EditData
                case 'Cancel'
                case 'Add'
                    AddMask(app,event,CSVID);
                case 'Remove'
                    RemoveCSVMask(app,event,CSVID);
            end
        case 2 % for Active control
            ActiveCSVMask(app,event,CSVID);
        case 3 % for Inverse control
            InvertCSVMask(app,event,CSVID);
    end
end

GeneralFunc.UpdateCSVMaskTable(app,event);
GeneralFunc.DrawEffectiveMaskPreview(app, event);

function AddMask(app,event,CSVID)
SearchFile = fullfile(app.AdditionalInfo.LastMaskImportFolder,'*.csv;*.dat');
[CSVFN,CSVFF] = uigetfile(SearchFile);
if CSVFN == 0
    % GeneralFunc.BusyControl(app,event,false)
    return
else
    app.AdditionalInfo.LastMaskImportFolder = CSVFF;
    CSVFP = fullfile(CSVFF,CSVFN);
end

[~,~,FileExt] = fileparts(CSVFN);

if strcmpi(FileExt,'.dat')
    FileType = 'DAT';
elseif strcmpi(FileExt,'.csv')
    FileType = 'CSV';
end

switch FileType
    case 'DAT'
        DATData = load(CSVFP);
        DATData = fliplr(DATData(:,1:2));
        Mask = CSVData2Matrix(DATData,app.CurrentData.MasterInfo.YPixelsInDetector,app.CurrentData.MasterInfo.XPixelsInDetector);
        
    case 'CSV'
        CSVData = LoadDataFromCSV(CSVFP);
        Mask = CSVData2Matrix(CSVData,app.CurrentData.MasterInfo.YPixelsInDetector,app.CurrentData.MasterInfo.XPixelsInDetector);
end

app.MaskInfo.MaskPool{CSVID}.Mask = Mask;
app.MaskInfo.MaskPool{CSVID}.CSVFN = CSVFN;
app.MaskInfo.MaskPool{CSVID}.CSVFF = CSVFF;
app.MaskInfo.MaskPool{CSVID}.CSVFP = CSVFP;
app.MaskInfo.MaskPool{CSVID}.Active = true;
app.MaskInfo.MaskPool{CSVID}.Inverse = false;

function RemoveCSVMask(app,event,CSVID)
app.MaskInfo.MaskPool{CSVID} = [];

function ActiveCSVMask(app,event,CSVID)
if isempty(app.MaskInfo.MaskPool{CSVID})
    % GeneralFunc.BusyControl(app,event,false)
    return
else
    app.MaskInfo.MaskPool{CSVID}.Active = ~app.MaskInfo.MaskPool{CSVID}.Active;
end

function InvertCSVMask(app,event,CSVID)
if isempty(app.MaskInfo.MaskPool{CSVID})
    % GeneralFunc.BusyControl(app,event,false)
    return
else
    app.MaskInfo.MaskPool{CSVID}.Inverse = ~app.MaskInfo.MaskPool{CSVID}.Inverse;
end

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
