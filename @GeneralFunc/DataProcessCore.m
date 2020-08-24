function [ImageForDrawing,ProfileForDrawing] = DataProcessCore(DataPackage)

NormRawData = DataPackage.RawData/DataPackage.MasterInfo.CountTime/DataPackage.MasterInfo.AveragedDataSheetNum/DataPackage.INormalization;
if ~isempty(DataPackage.Background)
    NormRawBackground =  DataPackage.Background/DataPackage.BackgroundCT/DataPackage.BackgroundAveragedDataSheetNum;
    NormRawData = NormRawData/DataPackage.SampleTrans - NormRawBackground/DataPackage.BufferTrans;
end

% 2D image part
if isempty(DataPackage.EffectiveMask)
    ImageForDrawing = NormRawData;
else
    ImageForDrawing = NormRawData.* ~DataPackage.EffectiveMask;
end

% 1D profile part
GuidingIdxVector = DataPackage.ImageProfileConvertor.GuidingIdxVector;
XAxis = DataPackage.ImageProfileConvertor.XAxis;
NumPixelInqSection = DataPackage.ImageProfileConvertor.NumPixelInqSection;
AllowIdx = DataPackage.ImageProfileConvertor.AllowIdx;

GuidingIdxVector = int32(GuidingIdxVector);
NormRawData = single(NormRawData);

RawDataVectorTemp = NormRawData(:);
RawDataVector = RawDataVectorTemp(AllowIdx);
Intensity = transpose(accumarray(GuidingIdxVector,RawDataVector))./NumPixelInqSection;
Error = transpose(accumarray(GuidingIdxVector,sqrt(abs(RawDataVector))))./NumPixelInqSection;

ProfileForDrawing = [XAxis;Intensity;Error];