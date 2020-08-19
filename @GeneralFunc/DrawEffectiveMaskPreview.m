function DrawEffectiveMaskPreview(app, event)
EffectiveMaskPoolNum = app.AdditionalInfo.EffectiveMaskPoolNum;
EffectiveMaskPreview = false(app.MasterInfo.Default.YPixelsInDetector,app.MasterInfo.Default.XPixelsInDetector);

for MaskID = 1:EffectiveMaskPoolNum
    if isempty(app.MaskInfo.MaskPool{MaskID})
        continue
    else
        if app.MaskInfo.MaskPool{MaskID}.Active
            if app.MaskInfo.MaskPool{MaskID}.Inverse
                EffectiveMaskPreview = or(EffectiveMaskPreview,~app.MaskInfo.MaskPool{MaskID}.Mask);
            else
                EffectiveMaskPreview = or(EffectiveMaskPreview,app.MaskInfo.MaskPool{MaskID}.Mask);
            end
        else
            continue
        end
    end
end

app.MaskInfo.EffectiveMaskPreview = or(EffectiveMaskPreview,app.MasterInfo.Default.PixelMask);

app.PlotHandles.EffectiveMaskPreview = imagesc(app.EffectiveMaskPreviewUIAxes,app.MaskInfo.EffectiveMaskPreview);
axis(app.EffectiveMaskPreviewUIAxes,'image')
colormap(app.EffectiveMaskPreviewUIAxes,flipud(gray));