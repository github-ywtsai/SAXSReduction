function PlotCurrentImage(app,event)

app.PlotHandles.Image = imagesc(app.ImageUIAxes,app.CurrentData.ImageForDrawing);
axis(app.ImageUIAxes,'image')

app.PlotHandles.Profile = plot(app.ProfileUIAxes,app.CurrentData.ProfileForDrawing(1,:),app.CurrentData.ProfileForDrawing(2,:));