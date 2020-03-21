function ExportCurrentProfile(app,event)
if isempty(app.CurrentData)
    return
end

[FN,FF] = uiputfile([app.CurrentData.Title '.txt']);
if FN == 0
    return
end
FP = fullfile(FF,FN);

fid = fopen(FP,'w');
fprintf(fid,'%e\t%e\t%e\n',transpose(app.CurrentData.ProfileForDrawing));
fclose(fid);
%{
DataArray = array2table(transpose(app.CurrentData.ProfileForDrawing));
DataArray.Properties.VariableNames(1:3) = {'q','I','Error'};
writetable(DataArray,FP);
%}