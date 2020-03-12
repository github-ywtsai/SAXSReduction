function SingleDataProcess(app,event)

RawData = app.CurrentData.RawData;

% 2D image part
if isempty(app.CurrentData.MaskInfo.EffectiveMask)
    app.CurrentData.ImageForDrawing = RawData;
else
    app.CurrentData.ImageForDrawing = RawData.* ~app.CurrentData.MaskInfo.EffectiveMask;
end

% 1D profile part
RawDataVector = RawData(:);
GuidingIdxVector = app.CurrentData.ImageProfileConvertor.qSpace.GuidingIdxMatrix(:);
XAxis = app.CurrentData.ImageProfileConvertor.qSpace.Axis;
NumPixelInqSection = app.CurrentData.ImageProfileConvertor.qSpace.NumPixelInqSection;

IgnoreIdx = (GuidingIdxVector == 0);
RawDataVector(IgnoreIdx) = [];
GuidingIdxVector(IgnoreIdx) = [];

Intensity = transpose(accumarray(GuidingIdxVector,RawDataVector))./NumPixelInqSection;
app.CurrentData.ProfileForDrawing = [XAxis;Intensity];


