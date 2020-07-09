function AverageData(app,event)
GeneralFunc.BusyControl(app,event,true)

GeneralFunc.MessageControl(app,event,'Start to average data...','add');

RequestSNList = GenRequestSNList(app);

app.CurrentData.RequestSN = RequestSNList;

NumRequest = length(RequestSNList);

DataContainer = zeros(app.CurrentData.MasterInfo.YPixelsInDetector,app.CurrentData.MasterInfo.XPixelsInDetector);
for RequestSN = RequestSNList
    GeneralFunc.MessageControl(app,event,sprintf('Loading data %d ...',RequestSN),'replace');
    DataContainer = DataContainer + single(EigerDataFunc.ReadEigerHDF5Data(app.CurrentData.MasterInfo,RequestSN,[],[]));
end
app.CurrentData.RawData = DataContainer;
app.MasterInfo.AveragedDataSheetNum = NumRequest;

[~,Title,~] = fileparts(app.CurrentData.MasterInfo.MasterFP); Title = strrep(Title,'_master','');
app.CurrentData.Title = sprintf('%s#%d:%d:%d',Title,app.MultiDataStartSNEditField.Value,app.MultiDataIncrementEditField.Value,app.MultiDataEndSNEditField.Value);

GeneralFunc.MessageControl(app,event,sprintf('Processing %d data ...',NumRequest),'replace');
GeneralFunc.SingleDataProcess(app,event);
GeneralFunc.MessageControl(app,event,sprintf('Processing %d data ... Done',NumRequest),'replace');
GeneralFunc.PlotCurrentImage(app,event);
GeneralFunc.PlotCurrentProfile(app,event);
GeneralFunc.BusyControl(app,event,false)

function RequestSNList = GenRequestSNList(app)
% check data sheet number and the start and the end SN
if app.MultiDataEndSNEditField.Value > app.CurrentData.MasterInfo.DataSheetNum
    app.MultiDataEndSNEditField.Value = double(app.CurrentData.MasterInfo.DataSheetNum);
end
if app.MultiDataStartSNEditField.Value < 1
    app.MultiDataStartSNEditField.Value = 1;
end
if app.MultiDataIncrementEditField.Value < 1
    app.MultiDataIncrementEditField.Value = 1;
end

StartSN = app.MultiDataStartSNEditField.Value;
Increment = app.MultiDataIncrementEditField.Value;
EndSN = app.MultiDataEndSNEditField.Value;

RequestSNList = StartSN:Increment:EndSN;

SkipSNString = app.MultiDataSkipSNEditField.Value;
SkipSNString = strsplit(SkipSNString,{';',',',' '});
SkipSN = str2double(SkipSNString);
NSkip = length(SkipSN);
for idx = 1:NSkip
    RequestSNList(RequestSNList == SkipSN(idx)) = [];
end