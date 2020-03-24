function DataProcess(app,event)
if isempty(app.CurrentData.MaskInfo.EffectiveMask)
    app.CurrentData.EffectiveMask = [];
else
    app.CurrentData.EffectiveMask = app.CurrentData.MaskInfo.EffectiveMask;
end
if isempty(app.BGInfo.Background)
    app.CurrentData.Background = [];
    app.CurrentData.BackgroundCT = [];
    app.CurrentData.SampleTrans = [];
    app.CurrentData.BufferTrans = [];
else
    app.CurrentData.BackgroundRawData = app.BGInfo.Background.RawData;
    app.CurrentData.BackgroundCT = app.BGInfo.Background.MasterInfo.CountTime;
    app.CurrentData.SampleTrans = app.BGInfo.Background.SampleTrans;
    app.CurrentData.BufferTrans = app.BGInfo.Background.BufferTrans;
end

NumData = size(app.CurrentData.RawData,3);

if isempty(app.CurrentData.Background)
    NormRawData = app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime;
else
    NormRawData = (app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime)/app.CurrentData.SampleTrans - (app.CurrentData.BackgroundRawData/app.CurrentData.BackgroundCT)/app.CurrentData.BufferTrans;
end

% 2D image part
if isempty(app.CurrentData.EffectiveMask)
    app.CurrentData.ImageForDrawing = sum(NormRawData,3)/NumData;
else
    app.CurrentData.ImageForDrawing = sum(NormRawData.* ~app.CurrentData.EffectiveMask,3)/NumData;
end

% 1D profile part
GuidingIdxVector = app.CurrentData.ImageProfileConvertor.GuidingIdxVector;
XAxis = app.CurrentData.ImageProfileConvertor.XAxis;
NumPixelInqSection = app.CurrentData.ImageProfileConvertor.NumPixelInqSection;
IgnoreIdx = app.CurrentData.ImageProfileConvertor.IgnoreIdx;
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
Error = sum(ErrorTemp,1)/NumData;
app.CurrentData.ProfileForDrawing = [XAxis;Intensity;Error];
