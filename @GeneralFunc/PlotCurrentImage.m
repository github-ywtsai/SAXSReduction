function PlotCurrentImage(app,event)

app.PlotHandles.Image = imagesc(app.ImageUIAxes,app.CurrentData.MaskedData);
axis(app.ImageUIAxes,'image')