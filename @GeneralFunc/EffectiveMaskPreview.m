function EffectiveMaskPreview(app, event)

app.PlotHandles.EffectiveMaskPreview = imagesc(app.EffectiveMaskPreviewUIAxes,app.CurrentData.MaskInfo.EffectiveMask);
axis(app.EffectiveMaskPreviewUIAxes,'image')
colormap(app.EffectiveMaskPreviewUIAxes,flipud(gray));