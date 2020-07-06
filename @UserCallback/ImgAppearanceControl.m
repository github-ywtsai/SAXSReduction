function ImgAppearanceControl(app,event)
if event.Source == app.ImageIntensityScaleButtonGroup
    % Operation = 'Scaler Mode Change';
elseif event.Source == app.IntensityRangeButtonGroup
    % Operation = 'Threshold Mode Change';
    if event.NewValue == app.ImgIntensityRangeAutoButton
        app.LowThresholdSlider.Enable = 'Off';
        app.HighThresholdSlider.Enable = 'Off';
    elseif event.NewValue == app.ImgIntensityRangeManualButton
        app.LowThresholdSlider.Enable = 'On';
        app.HighThresholdSlider.Enable = 'On';
    end
elseif event.Source == app.HighThresholdSlider
    % Operation = 'High Threshold Change';
elseif event.Source == app.LowThresholdSlider
    % Operation = 'Low Threshold Change';
else
    % Operation = 'Plot New Image';
end

colormap(app.ImageUIAxes,app.ColormapDropDown.Value)

% IntnesityScaleControl
if app.ImageIntensityScaleButtonGroup.SelectedObject == app.ImageIntensityLogButton
    app.ImageUIAxes.ColorScale = 'log';
else
    app.ImageUIAxes.ColorScale = 'linear';
end
% IntensityRangeControl
if app.IntensityRangeButtonGroup.SelectedObject == app.ImgIntensityRangeAutoButton
    app.ImageUIAxes.CLimMode = 'Auto';
elseif app.IntensityRangeButtonGroup.SelectedObject == app.ImgIntensityRangeManualButton
    if strcmpi(event.EventName,'Valuechanging')
        if event.Source == app.HighThresholdSlider
            HighThresholdSliderValue = event.Value;
            LowThresholdSliderValue = app.LowThresholdSlider.Value;
        elseif event.Source == app.LowThresholdSlider
            HighThresholdSliderValue = app.HighThresholdSlider.Value;
            LowThresholdSliderValue = event.Value;
        end

    elseif strcmpi(event.EventName,'Valuechanged')
        HighThresholdSliderValue = app.HighThresholdSlider.Value;
        LowThresholdSliderValue = app.LowThresholdSlider.Value;
    else
        HighThresholdSliderValue = app.HighThresholdSlider.Value;
        LowThresholdSliderValue = app.LowThresholdSlider.Value;
    end
    ThresholdValue = [GeneralFunc.ImgThresholdSliderValueConverter(LowThresholdSliderValue),GeneralFunc.ImgThresholdSliderValueConverter(HighThresholdSliderValue)];
    app.ImageUIAxes.CLim = ThresholdValue;
end