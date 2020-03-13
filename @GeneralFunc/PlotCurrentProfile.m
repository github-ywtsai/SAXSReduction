function PlotCurrentProfile(app,event)

app.PlotHandles.Profile = plot(app.ProfileUIAxes,app.CurrentData.ProfileForDrawing(1,:),app.CurrentData.ProfileForDrawing(2,:));

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