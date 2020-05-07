function DataProcess(app,event)

if isempty(app.CurrentData.Background)
    app.CurrentData.BackgroundCT = [];
    app.CurrentData.SampleTrans = [];
    app.CurrentData.BufferTrans = [];
else
    app.CurrentData.SampleTrans = app.SampleTransEditField.Value;
    app.CurrentData.BufferTrans = app.BufferTransEditField.Value;
end

NormRawData = app.CurrentData.RawData/app.CurrentData.MasterInfo.CountTime/app.CurrentData.MasterInfo.AveragedDataSheetNum;
if ~isempty(app.CurrentData.Background)
    NormRawBackground =  app.CurrentData.Background/app.CurrentData.BackgroundCT/app.CurrentData.BackgroundAveragedDataSheetNum;
    NormRawData = NormRawData/app.CurrentData.SampleTrans - NormRawBackground/app.CurrentData.BufferTrans;
end

% 2D image part
if isempty(app.CurrentData.EffectiveMask)
    app.CurrentData.ImageForDrawing = NormRawData;
else
    app.CurrentData.ImageForDrawing = NormRawData.* ~app.CurrentData.EffectiveMask;
end

% 1D profile part
GuidingIdxVector = app.CurrentData.ImageProfileConvertor.GuidingIdxVector;
XAxis = app.CurrentData.ImageProfileConvertor.XAxis;
NumPixelInqSection = app.CurrentData.ImageProfileConvertor.NumPixelInqSection;
AllowIdx = app.CurrentData.ImageProfileConvertor.AllowIdx;

GuidingIdxVector = int32(GuidingIdxVector);
NormRawData = single(NormRawData);

RawDataVectorTemp = NormRawData(:);
RawDataVector = RawDataVectorTemp(AllowIdx);
Intensity = transpose(accumarray(GuidingIdxVector,RawDataVector))./NumPixelInqSection;
Error = transpose(accumarray(GuidingIdxVector,sqrt(abs(RawDataVector))))./NumPixelInqSection;

app.CurrentData.ProfileForDrawing = [XAxis;Intensity;Error];