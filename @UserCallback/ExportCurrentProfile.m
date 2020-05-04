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
fprintf(fid,'%e\t%e\t%e\n',(app.CurrentData.ProfileForDrawing));
fclose(fid);
GeneralFunc.MessageControl(app,event,sprintf('Export current profile to %s done.',FN),'add');
%{
DataArray = array2table(transpose(app.CurrentData.ProfileForDrawing));
DataArray.Properties.VariableNames(1:3) = {'q','I','Error'};
writetable(DataArray,FP);
%}