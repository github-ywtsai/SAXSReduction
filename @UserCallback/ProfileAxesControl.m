function ProfileAxesControl(app,event)

if event.Source == app.ProfileXAxisScaleButtonGroup
    if app.ProfileXAxisScaleButtonGroup.SelectedObject == app.ProfileXAxisLogButton
        app.ProfileUIAxes.XScale = 'log';
    else
        app.ProfileUIAxes.XScale = 'linear';
    end
elseif event.Source == app.ProfileYAxisScaleButtonGroup
    if app.ProfileYAxisScaleButtonGroup.SelectedObject == app.ProfileYAxisLogButton
        app.ProfileUIAxes.YScale = 'log';
    else
        app.ProfileUIAxes.YScale = 'linear';
    end
elseif event.Source == app.MultiProfileXAxisScaleButtonGroup
    if app.MultiProfileXAxisScaleButtonGroup.SelectedObject == app.MultiProfileXAxisLogButton
        app.MultiProfileUIAxes.XScale = 'log';
    else
        app.MultiProfileUIAxes.XScale = 'linear';
    end
elseif event.Source == app.MultiProfileYAxisScaleButtonGroup
    if app.MultiProfileYAxisScaleButtonGroup.SelectedObject == app.MultiProfileYAxisLogButton
        app.MultiProfileUIAxes.YScale = 'log';
    else
        app.MultiProfileUIAxes.YScale = 'linear';
    end
end
