function PlotCurrentImage(app,event)

ImageForDrawimg = app.CurrentData.ImageForDrawing;
[RowSize,ColSize] = size(ImageForDrawimg);

% prepare xaxis and yaxis
xAxis = app.CurrentData.ImageProfileConvertor.ImgqyAxis;
yAxis = app.CurrentData.ImageProfileConvertor.ImgqzAxis;
xAxisLabel = sprintf('q_y(1/%c)',char(197));
yAxisLabel = sprintf('q_z(1/%c)',char(197));

app.PlotHandles.Image = imagesc(app.ImageUIAxes,xAxis,yAxis,ImageForDrawimg);
axtoolbar(app.ImageUIAxes,{'datacursor','zoomin','zoomout','restoreview'});
app.ImageUIAxes.DataAspectRatio = [1 1 1];
app.ImageUIAxes.PlotBoxAspectRatio = [ColSize RowSize 1];
app.ImageUIAxes.XLabel.String = xAxisLabel;
app.ImageUIAxes.YLabel.String = yAxisLabel;
% DataAspectRatio & PlotBoxAspectRatio configuration affect the same with
% axis image but faster.
% axis(app.ImageUIAxes,'image')
% "axis image" takes almost 0.2 sec, control the data and plotbox aspect
% ratio in uiaxes.DataAspectRation when uiaxes is creating.
title(app.ImageUIAxes,app.CurrentData.Title,'interpreter', 'none');
colorbar(app.ImageUIAxes)

UserCallback.ImgAppearanceControl(app,event);