function UpdateEffectiveMask(app, event)

EffectiveMask = false(app.CurrentData.MasterInfo.YPixelsInDetector,app.CurrentData.MasterInfo.XPixelsInDetector);

for MaskID = 1:10
    if isempty(app.CurrentData.MaskInfo.MaskPool{MaskID})
        continue
    else
        if app.CurrentData.MaskInfo.MaskPool{MaskID}.Active
            if app.CurrentData.MaskInfo.MaskPool{MaskID}.Inverse
                EffectiveMask = or(EffectiveMask,~app.CurrentData.MaskInfo.MaskPool{MaskID}.Mask);
            else
                EffectiveMask = or(EffectiveMask,app.CurrentData.MaskInfo.MaskPool{MaskID}.Mask);
            end
        else
            continue
        end
    end
end

app.CurrentData.MaskInfo.EffectiveMask = or(EffectiveMask,app.CurrentData.MasterInfo.PixelMask);
