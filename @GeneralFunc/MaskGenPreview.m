function MaskGenPreview(app, event)

MaskPreview = app.MaskGen.MaskPreview;
AlphaDataForMaskPreview = ones(size(MaskPreview)) - ~MaskPreview*0.7;
app.PlotHandles.MaskPreview = imagesc(app.MaskPreviewUIAxes,app.CurrentData.ImageForDrawing,'AlphaData',AlphaDataForMaskPreview);

axis(app.MaskPreviewUIAxes,'image');

% Colormap control
SelectedColorMap = app.ColormapDropDown.Value;
if strcmpi(SelectedColorMap,'albula')
    colormap(app.MaskPreviewUIAxes,app.AdditionalInfo.ColormapAlbula)
else
    colormap(app.ImageUIAxes,app.ColormapDropDown.Value)
end

if app.ImageIntensityScaleButtonGroup.SelectedObject == app.ImageIntensityLogButton
    app.MaskPreviewUIAxes.ColorScale = 'log';
else
    app.MaskPreviewUIAxes.ColorScale = 'linear';
end
