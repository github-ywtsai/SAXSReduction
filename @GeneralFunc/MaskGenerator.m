function MaskGenerator(app,event)

MaskType = 'Radius';

switch MaskType
    case 'Radius'
        MaskPreview = RadiusMaskGen(app,event);
end

app.MaskGen.MaskPreview = MaskPreview;

function Mask = RadiusMaskGen(app,event)

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
AngularMask = AngularMaskGen(StartAng,EndAng,AngleDisMatrix);

if app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenNoneSymButton
    % SymCase = 'None';
    Mask = and(DistanceMask, AngularMask);
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenCenSymButton
    % SymCase = 'Central';
    CenSymAngularMask = AngularMaskGen(StartAng,EndAng,CensymmetryAngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, CenSymAngularMask));
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenXMirrorButton
    % SymCase = 'XMirror';
    XMirrorAngularMask = AngularMaskGen(StartAng,EndAng, XMirrorAngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, XMirrorAngularMask));
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenYMirrorButton
    % SymCase = 'YMirror';
    YMirrorAngularMask = AngularMaskGen(StartAng,EndAng,YMirrorAngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, YMirrorAngularMask));
end

function AngularMask = AngularMaskGen(StartAng,EndAng,AngleDisMatrix)
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
