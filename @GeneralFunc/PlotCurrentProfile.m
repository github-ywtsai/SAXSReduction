function PlotCurrentProfile(app,event)

app.PlotHandles.Profile = plot(app.ProfileUIAxes,app.CurrentData.ProfileForDrawing(1,:),app.CurrentData.ProfileForDrawing(2,:));
axtoolbar(app.ProfileUIAxes,{'datacursor','zoomin','zoomout','restoreview'})
legend(app.ProfileUIAxes,app.CurrentData.Title,'interpreter', 'none');
title(app.ProfileUIAxes,'');
xlabel(app.ProfileUIAxes,app.CurrentData.ImageProfileConvertor.XAxisLabel,'interpreter', 'latex')
ylabel(app.ProfileUIAxes,'Normalized Intensity','interpreter', 'latex')
if app.ProfileXAxisScaleButtonGroup.SelectedObject == app.ProfileXAxisLogButton
    app.ProfileUIAxes.XScale = 'log';
else
    app.ProfileUIAxes.XScale = 'linear';
end

if app.ProfileYAxisScaleButtonGroup.SelectedObject == app.ProfileYAxisLogButton
    app.ProfileUIAxes.YScale = 'log';
else
    app.ProfileUIAxes.YScale = 'linear';
end
