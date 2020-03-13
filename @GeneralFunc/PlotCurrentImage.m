function PlotCurrentImage(app,event)

app.PlotHandles.Image = imagesc(app.ImageUIAxes,app.CurrentData.ImageForDrawing);
axis(app.ImageUIAxes,'image')