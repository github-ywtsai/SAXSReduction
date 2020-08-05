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

fid = fopen(FP,'w');
fprintf(fid,'    % .5f             % .5E             % .5E\n',(app.CurrentData.ProfileForDrawing));
fclose(fid);
GeneralFunc.MessageControl(app,event,sprintf('Export current profile to %s done.',FN),'add');