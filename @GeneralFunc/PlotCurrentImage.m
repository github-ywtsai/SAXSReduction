function PlotCurrentImage(app,event)

app.PlotHandles.Image = imagesc(app.ImageUIAxes,app.CurrentData.ImageForDrawing);
axis(app.ImageUIAxes,'image')
title(app.ImageUIAxes,app.CurrentData.Title,'interpreter', 'none');
colorbar(app.ImageUIAxes)

if app.ImageIntensityScaleButtonGroup.SelectedObject == app.ImageIntensityLogButton
    app.ImageUIAxes.ColorScale = 'log';
else
    app.ImageUIAxes.ColorScale = 'linear';
end