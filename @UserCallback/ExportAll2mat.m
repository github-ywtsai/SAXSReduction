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

CurrentData = app.CurrentData;
save(FP,'CurrentData')