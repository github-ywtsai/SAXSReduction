function ExportCurrentProfile(app,event)
if isempty(app.CurrentData)
    return
end
SearchFile = fullfile(app.AdditionalInfo.LastDataExportFolder,[app.CurrentData.Title '.txt']);
[FN,FF] = uiputfile(SearchFile);
if FN == 0
    return
end
app.AdditionalInfo.LastDataExportFolder = FF;
FP = fullfile(FF,FN);

DataPackage = app.CurrentData;
GeneralFunc.Export3ColsDataCore(FP,DataPackage);

GeneralFunc.MessageControl(app,event,sprintf('Exported current-profile to %s.',FN),'add');