function UpdateEffectiveMask(app, event)

EffectiveMask = false(app.MasterInfo.Default.YPixelsInDetector,app.MasterInfo.Default.XPixelsInDetector);

for MaskID = 1:10
    if isempty(app.MaskInfo.MaskPool{MaskID})
        continue
    else
        if app.MaskInfo.MaskPool{MaskID}.Active
            if app.MaskInfo.MaskPool{MaskID}.Inverse
                EffectiveMask = or(EffectiveMask,~app.MaskInfo.MaskPool{MaskID}.Mask);
            else
                EffectiveMask = or(EffectiveMask,app.MaskInfo.MaskPool{MaskID}.Mask);
            end
        else
            continue
        end
    end
end

app.MaskInfo.EffectiveMask = or(EffectiveMask,app.MasterInfo.Default.PixelMask);
app.CurrentData.EffectiveMask = app.MaskInfo.EffectiveMask;

% Update image to profile configuration
GeneralFunc.ImageProfileConfig(app,event);
