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

% coonfigurate the x/y axis
[RowSize,ColSize] = size(app.CurrentData.ImageForDrawing);
app.ImageUIAxes.YAxis.Direction = 'normal';

app.PlotHandles.Image.XData = app.CurrentData.ImageProfileConvertor.ImgqyAxis;
app.PlotHandles.Image.YData = app.CurrentData.ImageProfileConvertor.ImgqzAxis;

xAxisLabelString = 'q$_y$(1/\AA)';
yAxisLabelString = 'q$_z$(1/\AA)';
app.ImageUIAxes.XLabel.Interpreter = 'latex';
app.ImageUIAxes.YLabel.Interpreter = 'latex';
app.ImageUIAxes.XLabel.String = xAxisLabelString;
app.ImageUIAxes.YLabel.String = yAxisLabelString;

app.ImageUIAxes.DataAspectRatio = [1 1 1];
app.ImageUIAxes.PlotBoxAspectRatio = [ColSize RowSize 1];

app.ImageUIAxes.XLim = [-inf inf];
app.ImageUIAxes.YLim = [-inf inf];

% DataAspectRatio & PlotBoxAspectRatio configuration affect the same with
% axis image but faster.
% axis(app.ImageUIAxes,'image')
% "axis image" takes almost 0.2 sec, control the data and plotbox aspect
% ratio in uiaxes.DataAspectRation when uiaxes is creating.

% Colormap control
SelectedColorMap = app.ColormapDropDown.Value;
if strcmpi(SelectedColorMap,'albula')
    colormap(app.ImageUIAxes,app.AdditionalInfo.ColormapAlbula)
else
    colormap(app.ImageUIAxes,app.ColormapDropDown.Value)
end

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