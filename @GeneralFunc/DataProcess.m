function DataProcess(app,event)

NumData = size(app.CurrentData.RawData,3);

if isempty(app.BGInfo.Background)
    NormRawData = app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime;
else
    NormRawData = (app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime)/app.BGInfo.Background.SampleTrans - (app.BGInfo.Background.RawData/app.BGInfo.Background.MasterInfo.CountTime)/app.BGInfo.Background.BufferTrans;
end

% 2D image part
if isempty(app.CurrentData.MaskInfo.EffectiveMask)
    app.CurrentData.ImageForDrawing = sum(NormRawData,3)/NumData;
else
    app.CurrentData.ImageForDrawing = sum(NormRawData.* ~app.CurrentData.MaskInfo.EffectiveMask,3)/NumData;
end

% 1D profile part
GuidingIdxVector = app.CurrentData.ImageProfileConvertor.qSpace.GuidingIdxVector;
XAxis = app.CurrentData.ImageProfileConvertor.qSpace.Axis;
NumPixelInqSection = app.CurrentData.ImageProfileConvertor.qSpace.NumPixelInqSection;
IgnoreIdx = app.CurrentData.ImageProfileConvertor.qSpace.IgnoreIdx;
IntensityTemp = zeros(NumData,length(XAxis));
ErrorTemp = zeros(NumData,length(XAxis));
for DataSN = 1:NumData
    NormRawDataTemp = NormRawData(:,:,DataSN);
    RawDataVector = NormRawDataTemp(:);
    RawDataVector(IgnoreIdx) = [];

    IntensityTemp(DataSN,:) = transpose(accumarray(GuidingIdxVector,RawDataVector))./NumPixelInqSection;
    ErrorTemp(DataSN,:) = transpose(accumarray(GuidingIdxVector,sqrt(abs(RawDataVector))))./NumPixelInqSection;
end
Intensity = sum(IntensityTemp,1)/NumData;
Error = sum(IntensityTemp,1)/NumData;
app.CurrentData.ProfileForDrawing = [XAxis;Intensity;Error];
