function MaskGenPreview(app, event)

MaskPreview = app.MaskGen.MaskPreview;
AlphaDataForMaskPreview = ones(size(MaskPreview)) - ~MaskPreview*0.7;
app.PlotHandles.MaskPreview = imagesc(app.MaskPreviewUIAxes,app.CurrentData.ImageForDrawing,'AlphaData',AlphaDataForMaskPreview);

axis(app.MaskPreviewUIAxes,'image');


% Colormap control
app.MaskPreviewUIAxes.Colormap = app.ImageUIAxes.Colormap;

% IntnesityScaleControl
app.MaskPreviewUIAxes.ColorScale = app.ImageUIAxes.ColorScale;

% IntensityRangeControl
app.MaskPreviewUIAxes.CLim = app.ImageUIAxes.CLim;