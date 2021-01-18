function PlotCurrentImage(app,event)

ImageForDrawimg = app.CurrentData.ImageForDrawing;

% plot 2d image
app.PlotHandles.Image = imagesc(app.ImageUIAxes,ImageForDrawimg);
axtoolbar(app.ImageUIAxes,{'datacursor','zoomin','zoomout','restoreview'});

title(app.ImageUIAxes,app.CurrentData.Title,'interpreter', 'none');
colorbar(app.ImageUIAxes)

UserCallback.ImgAppearanceControl(app,event);