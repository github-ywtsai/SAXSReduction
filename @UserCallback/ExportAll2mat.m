function ExportAll2mat(app,event)
if isempty(app.CurrentData)
    return
end

SearchFile = fullfile(app.AdditionalInfo.LastDataExportFolder,[app.CurrentData.Title '.mat']);
[FN,FF] = uiputfile(SearchFile);
if FN == 0
    return
end

app.AdditionalInfo.LastDataExportFolder = FF;
FP = fullfile(FF,FN);

GeneralFunc.BusyControl(app,event,1)
CurrentData = app.CurrentData;
                GeneralFunc.MessageControl(app,event,sprintf('Saving %s...',FN),'add');
                
save(FP,'CurrentData')
                GeneralFunc.MessageControl(app,event,sprintf('Saving %s...Done.',FN),'replace');
GeneralFunc.BusyControl(app,event,0)