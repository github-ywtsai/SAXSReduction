function ImageProfileConfig(app,event)

%% Required information
ImgXSize = app.CurrentData.MasterInfo.XPixelsInDetector;
ImgYSize = app.CurrentData.MasterInfo.YPixelsInDetector;
CenX = app.CurrentData.MasterInfo.BeamCenterX;
CenY = app.CurrentData.MasterInfo.BeamCenterY;
WL = app.CurrentData.MasterInfo.Wavelength; % [m]
XPixelSize = app.CurrentData.MasterInfo.XPixelSize; % [m]
YPixelSize = app.CurrentData.MasterInfo.YPixelSize; % [m]
SDDistance = app.CurrentData.MasterInfo.DetectorDistance; % [m]
if isempty(app.CurrentData.MaskInfo.EffectiveMask)
    Mask = app.CurrentData.MasterInfo.PixelMask;
else
    Mask = app.CurrentData.MaskInfo.EffectiveMask;
end

%% Calculating

YXPixelRatio = YPixelSize/XPixelSize; % using XPixelSize as reference when calculating pixel distance

[ColIdx,RowIdx] = meshgrid(1:ImgXSize,1:ImgYSize);
% generate a matrix that the value of masked pixels is NaN and nonmasked
% pixels is 1;
MaskNaNMatrix = ones(size(Mask));
MaskNaNMatrix(Mask == 1) = nan;


%% q axis
if app.XAxisResolutionButtonGroup.SelectedObject == app.XAxisOnePixelResButton
    % sqrt() is very slow.
    PixelDisMatrix =round(sqrt(((RowIdx-CenY)*YXPixelRatio).^2+(ColIdx-CenX).^2));
    TwoThetaMatrix = atan(PixelDisMatrix*XPixelSize/SDDistance);
    qMatrix = 4*pi/(WL*1E10)*sin(1/2 *TwoThetaMatrix); % [1/A]
    MaskedPixelDisMatrix = PixelDisMatrix.* MaskNaNMatrix;
    MaskedqMatrix = qMatrix .* MaskNaNMatrix;
    PixelDisMin = min(MaskedPixelDisMatrix,[],'all');
    PixelDisMax = max(MaskedPixelDisMatrix,[],'all');
    PixelAxis = PixelDisMin:PixelDisMax;
    PixelSortingEdge = (PixelAxis(1):PixelAxis(end)+1)  - 0.5;
    TwoThetaAxis = atan(PixelAxis*XPixelSize/SDDistance);
    TwoThetaSortingEdge = atan(PixelSortingEdge*XPixelSize/SDDistance);
    qAxis = 4*pi/(WL*1E10)*sin(1/2 *TwoThetaAxis); % [1/A]
    qSortingEdge =  4*pi/(WL*1E10)*sin(1/2 *TwoThetaSortingEdge); % [1/A]
elseif app.XAxisResolutionButtonGroup.SelectedObject == app.XAxisPointsResButton
    % sqrt() is very slow.
    PixelDisMatrix = sqrt(((RowIdx-CenY)*YXPixelRatio).^2+(ColIdx-CenX).^2);
    % q = 4pi/sin(th)/lambda, atan also takes a lot of time.
    TwoThetaMatrix = atan(PixelDisMatrix*XPixelSize/SDDistance);
    qMatrix = 4*pi/(WL*1E10)*sin(1/2 *TwoThetaMatrix); % [1/A]
    qAxisPts = round(app.XAxisPoints.Value);
    MaskedqMatrix = qMatrix .* MaskNaNMatrix;
    qMin = min(MaskedqMatrix,[],'all');
    qMax = max(MaskedqMatrix,[],'all');
    qAxis = linspace(qMin,qMax,qAxisPts);
    qAxisRightShift = [-Inf qAxis];
    qAxisLeftShift = [qAxis Inf];
    qSortingEdge = (qAxisRightShift + qAxisLeftShift)/2;
end

[NumPixelInqSection,~,GuidingIdxMatrix] = histcounts(MaskedqMatrix,qSortingEdge);
IgnoreIdx = (GuidingIdxMatrix(:) == 0);
GuidingIdxVector = GuidingIdxMatrix(:);
GuidingIdxVector(IgnoreIdx) = [];

app.CurrentData.ImageProfileConvertor.qSpace.DsitributionMatrix = qMatrix; % record q or th distribution
app.CurrentData.ImageProfileConvertor.qSpace.PixelDisMatrix = PixelDisMatrix; % record pixel distance
app.CurrentData.ImageProfileConvertor.qSpace.NumPixelInqSection = NumPixelInqSection;
app.CurrentData.ImageProfileConvertor.qSpace.GuidingIdxMatrix = GuidingIdxMatrix;
app.CurrentData.ImageProfileConvertor.qSpace.IgnoreIdx = IgnoreIdx;
app.CurrentData.ImageProfileConvertor.qSpace.GuidingIdxVector = GuidingIdxVector;
app.CurrentData.ImageProfileConvertor.qSpace.Axis = qAxis;

%{
%% Two Theta axis
MaskedTwoThetaMatrix = TwoThetaMatrix .* MaskNaNMatrix;
TwoThetaMin = min(MaskedTwoThetaMatrix,[],'all');
TwoThetaMax = max(MaskedTwoThetaMatrix,[],'all');
TwoThetaAxis = linspace(TwoThetaMin,TwoThetaMax,XAxisPts);
TwoThetaAxisRightShift = [-Inf TwoThetaAxis];
TwoThetaAxisLeftShift = [TwoThetaAxis Inf];
TwoThetaSortingEdge = (TwoThetaAxisRightShift + TwoThetaAxisLeftShift)/2;
[NumPixelInTwoThetaSection,~,TwoThetaGuidingIdxMatrix] = histcounts(MaskedTwoThetaMatrix,TwoThetaSortingEdge);
IgnoreIdx = (GuidingIdxMatrix(:) == 0);
GuidingIdxVector = GuidingIdxMatrix(:);
GuidingIdxVector(IgnoreIdx) = [];

app.CurrentData.ImageProfileConvertor.TwoThetaSpace.DsitributionMatrix = TwoThetaMatrix;
app.CurrentData.ImageProfileConvertor.TwoThetaSpace.PixelDisMatrix = PixelDisMatrix;
app.CurrentData.ImageProfileConvertor.TwoThetaSpace.NumPixelInqSection = NumPixelInqSection;
app.CurrentData.ImageProfileConvertor.TwoThetaSpace.GuidingIdxMatrix = GuidingIdxMatrix;
app.CurrentData.ImageProfileConvertor.TwoThetaSpace.IgnoreIdx = IgnoreIdx;
app.CurrentData.ImageProfileConvertor.TwoThetaSpace.GuidingIdxVector = GuidingIdxVector;
app.CurrentData.ImageProfileConvertor.TwoThetaSpace.Axis = TwoThetaAxis;
%}

