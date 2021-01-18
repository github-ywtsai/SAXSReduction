function MaskGenPreview(app, event)

MaskPreview = app.MaskGen.MaskPreview;
AlphaDataForMaskPreview = ones(size(MaskPreview)) - ~MaskPreview*0.7;
app.PlotHandles.MaskPreview = imagesc(app.MaskPreviewUIAxes,app.CurrentData.ImageForDrawing,'AlphaData',AlphaDataForMaskPreview);

% copy imgae configurations from app.ImageUIAxes and app.PlotHandles.Image
% to app.MaskPreviewUIAxes and app.PlotHandles.MaskPreview
[RowSize,ColSize] = size(app.CurrentData.ImageForDrawing);
app.MaskPreviewUIAxes.YAxis.Direction = app.ImageUIAxes.YAxis.Direction;

app.PlotHandles.MaskPreview.XData = app.PlotHandles.Image.XData; 
app.PlotHandles.MaskPreview.YData = app.PlotHandles.Image.YData;

app.MaskPreviewUIAxes.XLabel.Interpreter = app.ImageUIAxes.XLabel.Interpreter;
app.MaskPreviewUIAxes.YLabel.Interpreter = app.ImageUIAxes.YLabel.Interpreter;
app.MaskPreviewUIAxes.XLabel.String = app.ImageUIAxes.XLabel.String;
app.MaskPreviewUIAxes.YLabel.String = app.ImageUIAxes.YLabel.String;

app.MaskPreviewUIAxes.DataAspectRatio = [1 1 1];
app.MaskPreviewUIAxes.PlotBoxAspectRatio = [ColSize RowSize 1];

app.MaskPreviewUIAxes.XLim = [-inf inf];
app.MaskPreviewUIAxes.YLim = [-inf inf];


% Colormap control
app.MaskPreviewUIAxes.Colormap = app.ImageUIAxes.Colormap;

% IntnesityScaleControl
app.MaskPreviewUIAxes.ColorScale = app.ImageUIAxes.ColorScale;

% IntensityRangeControl
app.MaskPreviewUIAxes.CLim = app.ImageUIAxes.CLim;

% copy title
app.MaskPreviewUIAxes.Title.String = app.ImageUIAxes.Title.String;
app.MaskPreviewUIAxes.Title.Interpreter = app.ImageUIAxes.Title.Interpreter;

