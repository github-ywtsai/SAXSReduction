function PlotCurrentImage(app,event)

imagesc(app.ImageUIAxes,app.CurrentData.RawData);
axis(app.ImageUIAxes,'image')