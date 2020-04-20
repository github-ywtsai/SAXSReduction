function DataProcess(app,event)

if isempty(app.CurrentData.Background)
    app.CurrentData.BackgroundCT = [];
    app.CurrentData.SampleTrans = [];
    app.CurrentData.BufferTrans = [];
else
    app.CurrentData.SampleTrans = app.SampleTransEditField.Value;
    app.CurrentData.BufferTrans = app.BufferTransEditField.Value;
end

NumData = size(app.CurrentData.RawData,3);

if isempty(app.CurrentData.Background)
    NormRawData = app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime;
else
    NormRawData = (app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime)/app.CurrentData.SampleTrans - (app.CurrentData.Background/app.CurrentData.BackgroundCT)/app.CurrentData.BufferTrans;
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
AllowIdx = app.CurrentData.ImageProfileConvertor.AllowIdx;
IntensityTemp = zeros(NumData,length(XAxis));
ErrorTemp = zeros(NumData,length(XAxis));

for DataSN = 1:NumData
    NormRawDataTemp = NormRawData(:,:,DataSN);
    RawDataVectorTemp = NormRawDataTemp(:);
    RawDataVector = RawDataVectorTemp(AllowIdx);
    
    IntensityTemp(DataSN,:) = transpose(accumarray(GuidingIdxVector,RawDataVector))./NumPixelInqSection;
    ErrorTemp(DataSN,:) = transpose(accumarray(GuidingIdxVector,sqrt(abs(RawDataVector))))./NumPixelInqSection;
end

Intensity = sum(IntensityTemp,1)/NumData;
Error = sum(ErrorTemp,1)/NumData;
app.CurrentData.ProfileForDrawing = [XAxis;Intensity;Error];
