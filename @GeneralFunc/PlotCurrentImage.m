function PlotCurrentImage(app,event)

ImageForDrawimg = app.CurrentData.ImageForDrawing;
[RowSize,ColSize] = size(ImageForDrawimg);

% prepare xaxis and yaxis
xAxis = app.CurrentData.ImageProfileConvertor.ImgqyAxis;
yAxis = app.CurrentData.ImageProfileConvertor.ImgqzAxis;
%xAxisLabel = '$q_y$(1/\AA)';
%yAxisLabel = '$q_z$(1/\AA)';
xAxisLabelString = 'q$_y$(1/\AA)';
yAxisLabelString = 'q$_z$(1/\AA)';
app.PlotHandles.Image = imagesc(app.ImageUIAxes,xAxis,yAxis,ImageForDrawimg);
axtoolbar(app.ImageUIAxes,{'datacursor','zoomin','zoomout','restoreview'});
app.ImageUIAxes.DataAspectRatio = [1 1 1];
app.ImageUIAxes.PlotBoxAspectRatio = [ColSize RowSize 1];
app.ImageUIAxes.XLabel.Interpreter = 'latex';
app.ImageUIAxes.YLabel.Interpreter = 'latex';
app.ImageUIAxes.XLabel.String = xAxisLabelString;
app.ImageUIAxes.YLabel.String = yAxisLabelString;
% DataAspectRatio & PlotBoxAspectRatio configuration affect the same with
% axis image but faster.
% axis(app.ImageUIAxes,'image')
% "axis image" takes almost 0.2 sec, control the data and plotbox aspect
% ratio in uiaxes.DataAspectRation when uiaxes is creating.
title(app.ImageUIAxes,app.CurrentData.Title,'interpreter', 'none');
colorbar(app.ImageUIAxes)

UserCallback.ImgAppearanceControl(app,event);