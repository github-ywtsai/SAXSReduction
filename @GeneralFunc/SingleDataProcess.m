function SingleDataProcess(app,event)

NormRawData = app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime;

% 2D image part
if isempty(app.CurrentData.MaskInfo.EffectiveMask)
    app.CurrentData.ImageForDrawing = NormRawData;
else
    app.CurrentData.ImageForDrawing = NormRawData.* ~app.CurrentData.MaskInfo.EffectiveMask;
end

% 1D profile part
RawDataVector = NormRawData(:);
GuidingIdxVector = app.CurrentData.ImageProfileConvertor.qSpace.GuidingIdxVector;
XAxis = app.CurrentData.ImageProfileConvertor.qSpace.Axis;
NumPixelInqSection = app.CurrentData.ImageProfileConvertor.qSpace.NumPixelInqSection;

IgnoreIdx = app.CurrentData.ImageProfileConvertor.qSpace.IgnoreIdx;
RawDataVector(IgnoreIdx) = [];

Intensity = transpose(accumarray(GuidingIdxVector,RawDataVector))./NumPixelInqSection;
app.CurrentData.ProfileForDrawing = [XAxis;Intensity];