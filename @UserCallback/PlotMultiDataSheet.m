function PlotMultiDataSheet(app,event)

if event.Source == app.ExportMultiDataSheetButton
    FF = uigetdir();
    if FF == 0
        return
    end
end

GeneralFunc.BusyControl(app,event,true)
app.MainTabGroup.SelectedTab = app.MultiProfileTab;
GeneralFunc.MessageControl(app,event,'Start to plot data...','add');

RequestSNList = GenRequestSNList(app);

app.CurrentData.RequestSN = RequestSNList;

NumRequest = length(RequestSNList);
LegendList = cell(1,NumRequest);

DataPackage = app.CurrentData;
cla(app.MultiProfileUIAxes);

if app.MultiProfileXAxisScaleButtonGroup.SelectedObject == app.MultiProfileXAxisLogButton
    app.MultiProfileUIAxes.XScale = 'log';
else
    app.MultiProfileUIAxes.XScale = 'linear';
end

if app.MultiProfileYAxisScaleButtonGroup.SelectedObject == app.MultiProfileYAxisLogButton
    app.MultiProfileUIAxes.YScale = 'log';
else
    app.MultiProfileUIAxes.YScale = 'linear';
end

xlabel(app.MultiProfileUIAxes,DataPackage.ImageProfileConvertor.XAxisLabel,'interpreter', 'latex')
ylabel(app.MultiProfileUIAxes,'Normalized Intensity','interpreter', 'latex')

hold(app.MultiProfileUIAxes,'on')
for SN = 1:NumRequest
    RequestSN = RequestSNList(SN);
    
    DataPackage.RawData = single(EigerDataFunc.ReadEigerHDF5Data(app.CurrentData.MasterInfo,RequestSN,[],[]));
    DataPackage.SampleTrans = app.SampleTransEditField.Value;
    DataPackage.BufferTrans = app.BufferTransEditField.Value;
    [ImageForDrawing,ProfileForDrawing] = GeneralFunc.DataProcessCore(DataPackage);
    LegendList{SN} = sprintf('#%d',RequestSN);
    plot(app.MultiProfileUIAxes,ProfileForDrawing(1,:),ProfileForDrawing(2,:));
    legend(app.MultiProfileUIAxes, LegendList(1:SN),'interpreter', 'none')
    
    if event.Source == app.ExportMultiDataSheetButton
        [~,Title,~] = fileparts(DataPackage.MasterInfo.MasterFP); Title = strrep(Title,'_master','');        
        FN = [sprintf('%s#%d',Title,RequestSN) '.txt'];
        FP = fullfile(FF,FN);
        GeneralFunc.Export3ColsDataCore(FP,app.CurrentData);
        GeneralFunc.MessageControl(app,event,sprintf('Exported profile to %s.',FN),'add');
    else
        GeneralFunc.MessageControl(app,event,sprintf('Ploting data sheet %d ...',RequestSN),'replace');
    end
end
hold(app.MultiProfileUIAxes,'off')

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