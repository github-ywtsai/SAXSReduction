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
if isempty(app.CurrentData.EffectiveMask)
    Mask = app.CurrentData.MasterInfo.PixelMask;
else
    Mask = app.CurrentData.EffectiveMask;
end

%% Calculating
YXPixelRatio = YPixelSize/XPixelSize; % using XPixelSize as reference when calculating pixel distance

[ColIdx,RowIdx] = meshgrid(1:ImgXSize,1:ImgYSize);
% generate a matrix that the value of masked pixels is NaN and nonmasked
% pixels is 1;
MaskNaNMatrix = ones(size(Mask));
MaskNaNMatrix(Mask == 1) = nan;

%% Plotting Unit & Resolution
if app.XAxisUnitButtonGroup.SelectedObject == app.qXAxisUnitButton
    AxisUnit = 'q';
elseif app.XAxisUnitButtonGroup.SelectedObject == app.tthXAxisUnitButton
    AxisUnit = 'TwoTheta';
end

if app.XAxisResolutionButtonGroup.SelectedObject == app.XAxisOnePixelResButton
    AxisRes = '1Pixel';
elseif app.XAxisResolutionButtonGroup.SelectedObject == app.XAxisPointsResButton
    AxisRes = 'UserDefine';
end

%% Prepare qz and qy axis for 2D plot
VerticalPixelDisMatrix = RowIdx-CenY;
HorizontalPixelDisMatrix = ColIdx-CenX;
VerticalPixelDis = -VerticalPixelDisMatrix(:,1);
HorizontalPixelDis = HorizontalPixelDisMatrix(1,:);
TwoThetaAxis = atan(VerticalPixelDis*XPixelSize/SDDistance);
BetaAxis = atan(HorizontalPixelDis*XPixelSize/SDDistance);
qzAxis = 4*pi/(WL*1E10)*sin(1/2 *TwoThetaAxis);
qyAxis = 4*pi/(WL*1E10)*sin(1/2 *BetaAxis);

%% Mapping
PixelDisMatrix =sqrt((VerticalPixelDisMatrix*YXPixelRatio).^2+HorizontalPixelDisMatrix.^2); % sqrt() is very slow.
TwoThetaMatrix = atan(PixelDisMatrix*XPixelSize/SDDistance); % q = 4pi/sin(th)/lambda, atan also takes a lot of time.
qMatrix = 4*pi/(WL*1E10)*sin(1/2 *TwoThetaMatrix); % [1/A]
MaskedPixelDisMatrix = PixelDisMatrix .* MaskNaNMatrix;
MaskedTwoThetaMatrix = TwoThetaMatrix .* MaskNaNMatrix;
MaskedqMatrix = qMatrix .* MaskNaNMatrix;

switch AxisRes
    case '1Pixel'
        PixelDisMin = min(MaskedPixelDisMatrix,[],'all');
        PixelDisMax = max(MaskedPixelDisMatrix,[],'all');
        % pixel
        PixelAxis = round(PixelDisMin):round(PixelDisMax);
        PixelSortingEdge = (PixelAxis(1):PixelAxis(end)+1)  - 0.5;
        % tth
        TwoThetaAxis = atan(PixelAxis*XPixelSize/SDDistance);
        TwoThetaSortingEdge = atan(PixelSortingEdge*XPixelSize/SDDistance);
        % q
        qAxis = 4*pi/(WL*1E10)*sin(1/2 *TwoThetaAxis); % [1/A]
        qSortingEdge =  4*pi/(WL*1E10)*sin(1/2 *TwoThetaSortingEdge); % [1/A]
    case 'UserDefine'
        AxisPts = round(app.XAxisPoints.Value);
        % q
        qMin = min(MaskedqMatrix,[],'all');
        qMax = max(MaskedqMatrix,[],'all');
        qAxis = linspace(qMin,qMax,AxisPts);
        qAxisRightShift = [-Inf qAxis];
        qAxisLeftShift = [qAxis Inf];
        qSortingEdge = (qAxisRightShift + qAxisLeftShift)/2;
        % tth
        TwoThetaMin = min(MaskedTwoThetaMatrix,[],'all');
        TwoThetaMax = max(MaskedTwoThetaMatrix,[],'all');
        TwoThetaAxis = linspace(TwoThetaMin,TwoThetaMax,AxisPts);
        TwoThetaAxisRightShift = [-Inf TwoThetaAxis];
        TwoThetaAxisLeftShift = [TwoThetaAxis Inf];
        TwoThetaSortingEdge = (TwoThetaAxisRightShift + TwoThetaAxisLeftShift)/2;
end

switch AxisUnit
    case 'q'
        DistributionMatrix = qMatrix;
        MaskedMatrix = MaskedqMatrix;
        SortingEdge = qSortingEdge;
        XAxis = qAxis;
        XAxisLabel = 'q (1/A)';
    case 'TwoTheta'
        DistributionMatrix = TwoThetaMatrix;
        MaskedMatrix = MaskedTwoThetaMatrix;
        SortingEdge = TwoThetaSortingEdge;
        XAxis = TwoThetaAxis*180/pi;
        XAxisLabel = 'tth (deg.)';
end


[NumPixelInqSection,~,GuidingIdxMatrix] = histcounts(MaskedMatrix,SortingEdge);

AllowIdx = (GuidingIdxMatrix(:) ~= 0);
GuidingIdxVectorTemp = GuidingIdxMatrix(:);
GuidingIdxVector = GuidingIdxVectorTemp(AllowIdx);

Convertor.DistributionMatrix = DistributionMatrix; % record q or th distribution
Convertor.PixelDisMatrix = PixelDisMatrix; % record pixel distance
Convertor.NumPixelInqSection = NumPixelInqSection;
Convertor.GuidingIdxMatrix = GuidingIdxMatrix;
Convertor.AllowIdx = AllowIdx;
Convertor.GuidingIdxVector = GuidingIdxVector;
Convertor.XAxis = XAxis;
Convertor.XAxisLabel = XAxisLabel;
Convertor.ImgqzAxis = qzAxis;
Convertor.ImgqyAxis = qyAxis;

app.CurrentData.ImageProfileConvertor = Convertor;

