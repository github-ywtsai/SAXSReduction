function MaskGenerator(app,event)

if app.MaskGenTabGroup.SelectedTab == app.RadiusMaskGenTab
    MaskType = 'Radius';
elseif app.MaskGenTabGroup.SelectedTab == app.RectangleMaskGenTab
    MaskType = 'Rectangle';
end
%MaskType = 'Radius';


switch MaskType
    case 'Radius'
        MaskPreview = EffectiveRadiusMaskGen(app,event);
    case 'Rectangle'
        MaskPreview = EffectiveRectangleMaskGen(app,event);
end

app.MaskGen.MaskPreview = MaskPreview;


function Mask = EffectiveRectangleMaskGen(app,event)
ImgXSize = app.CurrentData.MasterInfo.XPixelsInDetector;
ImgYSize = app.CurrentData.MasterInfo.YPixelsInDetector;
SDDistance = app.CurrentData.MasterInfo.DetectorDistance; % [m]
WL = app.CurrentData.MasterInfo.Wavelength; % [m]
CenX = app.CurrentData.MasterInfo.BeamCenterX;
CenY = app.CurrentData.MasterInfo.BeamCenterY;
XPixelSize = app.CurrentData.MasterInfo.XPixelSize; % [m]
YPixelSize = app.CurrentData.MasterInfo.YPixelSize; % [m]
[ColIdx,RowIdx] = meshgrid(1:ImgXSize,1:ImgYSize);

VerticalPixelDisMatrix = RowIdx-CenY;
HorizontalPixelDisMatrix = ColIdx-CenX;
VerticalPixelDis = -VerticalPixelDisMatrix(:,1);
HorizontalPixelDis = HorizontalPixelDisMatrix(1,:);
TwoThetaAxis = atan(VerticalPixelDis*YPixelSize/SDDistance);
BetaAxis = atan(HorizontalPixelDis*XPixelSize/SDDistance);
qzAxis = 4*pi/(WL*1E10)*sin(1/2 *TwoThetaAxis);
qrAxis = 4*pi/(WL*1E10)*sin(1/2 *BetaAxis);
[qrDistributionMatrix,qzDistributionMatrix] = meshgrid(qrAxis,qzAxis);

qrMin = app.RectangleMaskGenUITable.Data{1,2};
qrMax = app.RectangleMaskGenUITable.Data{2,2};
qzMin = app.RectangleMaskGenUITable.Data{3,2};
qzMax = app.RectangleMaskGenUITable.Data{4,2};

RectangleMask = RectanglMaskGen(qrMin,qrMax,qzMin,qzMax,qrDistributionMatrix,qzDistributionMatrix);
if app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenNoneSymButton
    % SymCase = 'None';
    Mask = RectangleMask;
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenCenSymButton
    % SymCase = 'Central';
    CenSymRectangleMask = RectanglMaskGen(qrMin,qrMax,qzMin,qzMax,-qrDistributionMatrix,-qzDistributionMatrix);
    Mask = or(RectangleMask, CenSymRectangleMask);
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenXMirrorButton
    % SymCase = 'XMirror';
    XMirrorRectangleMask = RectanglMaskGen(qrMin,qrMax,qzMin,qzMax,-qrDistributionMatrix,qzDistributionMatrix);
    Mask = or(RectangleMask, XMirrorRectangleMask);
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenYMirrorButton
    % SymCase = 'YMirror';
    YMirrorRectangleMask = RectanglMaskGen(qrMin,qrMax,qzMin,qzMax,qrDistributionMatrix,-qzDistributionMatrix);
    Mask = or(RectangleMask, YMirrorRectangleMask);
end


function Mask = RectanglMaskGen(qrMin,qrMax,qzMin,qzMax,YDistributionMatrix,ZDistributionMatrix)
qyMask = and(YDistributionMatrix<=qrMax,YDistributionMatrix>=qrMin);
qrMask = and(ZDistributionMatrix<=qzMax,ZDistributionMatrix>=qzMin);

Mask = and(qyMask,qrMask);



function Mask = EffectiveRadiusMaskGen(app,event)

ImgXSize = app.CurrentData.MasterInfo.XPixelsInDetector;
ImgYSize = app.CurrentData.MasterInfo.YPixelsInDetector;
CenX = app.CurrentData.MasterInfo.BeamCenterX;
CenY = app.CurrentData.MasterInfo.BeamCenterY;
XPixelSize = app.CurrentData.MasterInfo.XPixelSize; % [m]
YPixelSize = app.CurrentData.MasterInfo.YPixelSize; % [m]

DistributionMatrix = app.CurrentData.ImageProfileConvertor.DistributionMatrix; % q or th matrix
MinValue = app.RadiusMaskGenUITable.Data{1,2};
MaxValue = app.RadiusMaskGenUITable.Data{2,2};
StartAng = app.RadiusMaskGenUITable.Data{3,2};
EndAng = app.RadiusMaskGenUITable.Data{4,2};


[ColIdx,RowIdx] = meshgrid(1:ImgXSize,1:ImgYSize);
% [ColIdx,RowIdx] = ndgrid(1:size(DsitributionMatrix,1),1:size(DsitributionMatrix,2));

YXPixelRatio = YPixelSize/XPixelSize; % using XPixelSize as reference when calculating pixel distance
PixelXDisMatrix = ColIdx-CenX;
PixelYDisMatrix = -(RowIdx-CenY)*YXPixelRatio; % RowIdx direction is -y, so add a - at the head.

[AngleDisMatrix,~] = cart2pol(PixelXDisMatrix,PixelYDisMatrix);
AngleDisMatrix = AngleDisMatrix*180/pi; % in degress, from 0 to 180 and -0 to -180.

[CensymmetryAngleDisMatrix,~] = cart2pol(-PixelXDisMatrix,-PixelYDisMatrix);
CensymmetryAngleDisMatrix = CensymmetryAngleDisMatrix*180/pi; % in degress, from 0 to 180 and -0 to -180.

[XMirrorAngleDisMatrix,~] = cart2pol(-PixelXDisMatrix,PixelYDisMatrix);
XMirrorAngleDisMatrix = XMirrorAngleDisMatrix*180/pi; % in degress, from 0 to 180 and -0 to -180.

[YMirrorAngleDisMatrix,~] = cart2pol(PixelXDisMatrix,-PixelYDisMatrix);
YMirrorAngleDisMatrix = YMirrorAngleDisMatrix*180/pi; % in degress, from 0 to 180 and -0 to -180.

% q or th part
DistanceMask= and(DistributionMatrix<=MaxValue, DistributionMatrix>=MinValue);
% angular part
AngularMask = RadiusMaskGen(StartAng,EndAng,AngleDisMatrix);

if app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenNoneSymButton
    % SymCase = 'None';
    Mask = and(DistanceMask, AngularMask);
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenCenSymButton
    % SymCase = 'Central';
    CenSymAngularMask = RadiusMaskGen(StartAng,EndAng,CensymmetryAngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, CenSymAngularMask));
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenXMirrorButton
    % SymCase = 'XMirror';
    XMirrorAngularMask = RadiusMaskGen(StartAng,EndAng, XMirrorAngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, XMirrorAngularMask));
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenYMirrorButton
    % SymCase = 'YMirror';
    YMirrorAngularMask = RadiusMaskGen(StartAng,EndAng,YMirrorAngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, YMirrorAngularMask));
end

function AngularMask = RadiusMaskGen(StartAng,EndAng,AngleDisMatrix)
AngularMask = zeros(size(AngleDisMatrix));

if and(StartAng>=0,EndAng>=0)
    AngleCase = 'AllPostive';
elseif and(StartAng<0,EndAng<0)
    AngleCase = 'AllNegtive';
else
    AngleCase = 'Both';
end

switch AngleCase
    case 'AllPostive'
        HAng = max([StartAng,EndAng]);
        LAng = min([StartAng,EndAng]);
        TargetIdx = AngleDisMatrix < 0;
        PosAngleDisMatrix = AngleDisMatrix.*~TargetIdx + (AngleDisMatrix+360).*TargetIdx; % transform AngleDisMatrix distribution from 0~180 and -0~-180 to 0~360 degrees
        AngularMask = and(PosAngleDisMatrix<=HAng, PosAngleDisMatrix>=LAng);
    case 'AllNegtive'
        HAng = max([StartAng,EndAng]);
        LAng = min([StartAng,EndAng]);
        TargetIdx = AngleDisMatrix > 0;
        NegAngleDisMatrix = AngleDisMatrix.*~TargetIdx + (AngleDisMatrix-360).*TargetIdx; % -0 to -360 degrees
        AngularMask = and(NegAngleDisMatrix<=HAng, NegAngleDisMatrix>=LAng);
    case 'Both'
        HAng = max([StartAng,EndAng]);
        LAng = min([StartAng,EndAng]);
        
        PosAngularMask = and(AngleDisMatrix<=HAng, AngleDisMatrix>=0);
        NegAngularMask = and(AngleDisMatrix>=LAng, AngleDisMatrix<0);
        AngularMask = or(PosAngularMask, NegAngularMask);
end
