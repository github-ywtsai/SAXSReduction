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

DsitributionMatrix = app.CurrentData.ImageProfileConvertor.DsitributionMatrix; % q or th matrix
MinValue = app.RadiusMaskGenUITable.Data{1,2};
MaxValue = app.RadiusMaskGenUITable.Data{2,2};
CenAng = app.RadiusMaskGenUITable.Data{3,2};
SweepAng = app.RadiusMaskGenUITable.Data{4,2};


[ColIdx,RowIdx] = meshgrid(1:ImgXSize,1:ImgYSize);
% [ColIdx,RowIdx] = ndgrid(1:size(DsitributionMatrix,1),1:size(DsitributionMatrix,2));

YXPixelRatio = YPixelSize/XPixelSize; % using XPixelSize as reference when calculating pixel distance
PixelXDisMatrix = ColIdx-CenX;
PixelYDisMatrix = -(RowIdx-CenY)*YXPixelRatio; % RowIdx direction is -y, so add a - at the head.
[AngleDisMatrix,~] = cart2pol(PixelXDisMatrix,PixelYDisMatrix);
AngleDisMatrix = AngleDisMatrix*180/pi; % in degress, from 0 to 180 and -0 to -180.

% q or th part
DistanceMask= and(DsitributionMatrix<=MaxValue, DsitributionMatrix>=MinValue);
% angular part
AngularMask = AngularMaskGen(CenAng,SweepAng,AngleDisMatrix);

if app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenNoneSymButton
    % SymCase = 'None';
    Mask = and(DistanceMask, AngularMask);
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenCenSymButton
    % SymCase = 'Central';
    CenSymAngularMask = AngularMaskGen(CenAng + 180,SweepAng,AngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, CenSymAngularMask));
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenXMirrorButton
    % SymCase = 'XMirror';
    XMirrorAngularMask = AngularMaskGen(180 - CenAng,SweepAng,AngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, XMirrorAngularMask));
elseif app.MaskGenSymmetryButtonGroup.SelectedObject == app.MaskGenYMirrorButton
    % SymCase = 'YMirror';
    YMirrorAngularMask = AngularMaskGen(-CenAng,SweepAng,AngleDisMatrix);
    Mask = and(DistanceMask, or(AngularMask, YMirrorAngularMask));
end

function AngularMask = AngularMaskGen(CenAng,SweepAng,AngleDisMatrix)
HAng = CenAng + SweepAng/2;
LAng = CenAng - SweepAng/2;

if HAng>=0 && LAng>=0
    AngleCase = 'AllPostive';
elseif HAng<=0 && LAng<=0
    AngleCase = 'AllNegtive';
else
    AngleCase = 'Both';
end

switch AngleCase
    case 'AllPostive'
        TargetIdx = AngleDisMatrix < 0;
        PosAngleDisMatrix = AngleDisMatrix.*~TargetIdx + (AngleDisMatrix+360).*TargetIdx; % 0 to 360 degrees
        AngularMask = and(PosAngleDisMatrix<=HAng, PosAngleDisMatrix>=LAng);
    case 'AllNegtive'
        TargetIdx = AngleDisMatrix > 0;
        NegAngleDisMatrix = AngleDisMatrix.*~TargetIdx + (AngleDisMatrix-360).*TargetIdx; % -0 to -360 degrees
        AngularMask = and(NegAngleDisMatrix<=HAng, NegAngleDisMatrix>=LAng);
    case 'Both'
        AngularMask = and(AngleDisMatrix<=HAng, AngleDisMatrix>=LAng);
end
