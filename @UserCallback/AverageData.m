function AverageData(app,event)
GeneralFunc.MessageControl(app,event,'Start to average data...','add');

RequestSNList = GenRequestSNList(app);

app.CurrentData.RequestSN = RequestSNList;

NumRequest = length(RequestSNList);

DataContainer = zeros(app.CurrentData.MasterInfo.YPixelsInDetector,app.CurrentData.MasterInfo.XPixelsInDetector,NumRequest);

ContainerIdx = 1;
for RequestSN = RequestSNList
    GeneralFunc.MessageControl(app,event,sprintf('Loading data %d ...',RequestSN),'replace');
    DataContainer(:,:,ContainerIdx) = single(EigerDataFunc.ReadEigerHDF5Data(app.CurrentData.MasterInfo,RequestSN,[],[]));
    ContainerIdx = ContainerIdx + 1;
end

app.CurrentData.RawData = DataContainer;
[~,Title,~] = fileparts(app.CurrentData.MasterInfo.MasterFP); Title = strrep(Title,'_master','');
app.CurrentData.Title = sprintf('%s#%d:%d:%d',Title,app.AvgDataStartSNEditField.Value,app.AvgDataIncrementEditField.Value,app.AvgDataEndSNEditField.Value);

GeneralFunc.MessageControl(app,event,sprintf('Processing %d data ...',NumRequest),'replace');
GeneralFunc.DataProcess(app,event);
GeneralFunc.MessageControl(app,event,sprintf('Processing %d data ... Done',NumRequest),'replace');
GeneralFunc.PlotCurrentImage(app,event);
GeneralFunc.PlotCurrentProfile(app,event);

function RequestSNList = GenRequestSNList(app)
StartSN = app.AvgDataStartSNEditField.Value;
Increment = app.AvgDataIncrementEditField.Value;
EndSN = app.AvgDataEndSNEditField.Value;
RequestSNList = StartSN:Increment:EndSN;

SkipSNString = app.AvgDataSkipSNEditField.Value;
SkipSNString = strrep(SkipSNString,';',',');
SkipSN = str2num(SkipSNString);
NSkip = length(SkipSN);
for idx = 1:NSkip
    RequestSNList(RequestSNList == SkipSN(idx)) = [];
end