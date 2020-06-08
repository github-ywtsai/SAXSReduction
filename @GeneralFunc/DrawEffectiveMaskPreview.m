function DrawEffectiveMaskPreview(app, event)

app.PlotHandles.EffectiveMaskPreview = imagesc(app.EffectiveMaskPreviewUIAxes,app.CurrentData.EffectiveMask);
axis(app.EffectiveMaskPreviewUIAxes,'image')
colormap(app.EffectiveMaskPreviewUIAxes,flipud(gray));