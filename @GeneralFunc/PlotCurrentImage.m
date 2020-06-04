function PlotCurrentImage(app,event)

ImageForDrawimg = app.CurrentData.ImageForDrawing;
[RowSize,ColSize] = size(ImageForDrawimg);

app.PlotHandles.Image = imagesc(app.ImageUIAxes,ImageForDrawimg);
axtoolbar(app.ImageUIAxes,{'datacursor','zoomin','zoomout','restoreview'});
app.ImageUIAxes.DataAspectRatio = [1 1 1];
app.ImageUIAxes.PlotBoxAspectRatio = [ColSize RowSize 1];
% DataAspectRatio & PlotBoxAspectRatio configuration affect the same with
% axis image but faster.
% axis(app.ImageUIAxes,'image')
% "axis image" takes almost 0.2 sec, control the data and plotbox aspect
% ratio in uiaxes.DataAspectRation when uiaxes is creating.
title(app.ImageUIAxes,app.CurrentData.Title,'interpreter', 'none');
colorbar(app.ImageUIAxes)


if app.ImageIntensityScaleButtonGroup.SelectedObject == app.ImageIntensityLogButton
    app.ImageUIAxes.ColorScale = 'log';
else
    app.ImageUIAxes.ColorScale = 'linear';
end