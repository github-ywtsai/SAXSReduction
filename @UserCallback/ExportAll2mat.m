function ExportAll2mat(app,event)
if isempty(app.CurrentData)
    return
end

[FN,FF] = uiputfile([app.CurrentData.Title '.mat']);
if FN == 0
    return
end

FP = fullfile(FF,FN);

CurrentData = app.CurrentData;
save(FP,'CurrentData')