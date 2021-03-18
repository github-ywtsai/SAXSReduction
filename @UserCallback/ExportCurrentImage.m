function ExportCurrentImage(app,event)

SearchFile = fullfile(app.AdditionalInfo.LastDataExportFolder,[app.CurrentData.Title '.tif']);
[FN,FF] = uiputfile(SearchFile);
if FN == 0
    return
end
app.AdditionalInfo.LastDataExportFolder = FF;
FP = fullfile(FF,FN);

exportgraphics(app.ImageUIAxes,FP,'Resolution',600) % require R2020a
