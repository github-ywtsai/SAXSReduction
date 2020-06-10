function EffectiveMaskControl(app,event)

if event.Source == app.EffectiveMaskIDDropDown
    Item = 'IDDropDown';
elseif event.Source == app.SaveMaskPreviewButton
    Item = 'SaveButton';
elseif event.Source == app.RemoveMaskPreviewButton
    Item = 'RemoveButton';
elseif event.Source == app.EffectiveMaskNameEditField
    Item = 'EditField';
end

switch Item
    case 'IDDropDown'
        DropDownSelect(app,event);
    case 'SaveButton'
        Save2EffectiveMaskPool(app,event);
    case 'RemoveButton'
        RemoveEffectiveMaskPool(app,event);
    case 'EditField'
end

UpdateEffectiveMaskPool(app,event);


function DropDownSelect(app,event)
EffMaskID = str2double(app.EffectiveMaskIDDropDown.Value);
if isempty(app.MaskInfo.EffectiveMaskPool{EffMaskID})
    app.EffectiveMaskNameEditField.Value = '';
else
    app.EffectiveMaskNameEditField.Value = app.MaskInfo.EffectiveMaskPool{EffMaskID}.MaskName;
end

function Save2EffectiveMaskPool(app,event)
EffMaskID = str2double(app.EffectiveMaskIDDropDown.Value);
app.MaskInfo.EffectiveMaskPool{EffMaskID}.Mask = app.MaskInfo.EffectiveMaskPreview;
MaskName = app.EffectiveMaskNameEditField.Value;
if isempty(MaskName)
    MaskName = sprintf('Mask_%d',EffMaskID);
end
app.MaskInfo.EffectiveMaskPool{EffMaskID}.MaskName = MaskName;

function RemoveEffectiveMaskPool(app,event)
EffMaskID = str2double(app.EffectiveMaskIDDropDown.Value);
app.MaskInfo.EffectiveMaskPool{EffMaskID} = [];


function UpdateEffectiveMaskPool(app,event)
% Effective Mask ID drowdown part
Items = cell(1,10);
for EffMaskSN = 1:10
    if isempty(app.MaskInfo.EffectiveMaskPool{EffMaskSN})
        Items{EffMaskSN} = sprintf('%d.',EffMaskSN);
    else
        Items{EffMaskSN} = sprintf('%d. %s',EffMaskSN,app.MaskInfo.EffectiveMaskPool{EffMaskSN}.MaskName);
    end
end
app.EffectiveMaskIDDropDown.Items = Items;

% update mask name to match the selected.
EffMaskID = str2double(app.EffectiveMaskIDDropDown.Value);
if isempty(app.MaskInfo.EffectiveMaskPool{EffMaskID})
    app.EffectiveMaskNameEditField.Value = '';
else
    app.EffectiveMaskNameEditField.Value = app.MaskInfo.EffectiveMaskPool{EffMaskID}.MaskName;
end

% update effective mask selection part
NonEmptyIdxInPool = find(cellfun(@(X)~isempty(X),app.MaskInfo.EffectiveMaskPool));
NEffMask = sum(cellfun(@(X)~isempty(X),app.MaskInfo.EffectiveMaskPool));
Items = cell(1,NEffMask);
ItemsData = cell(1,NEffMask);
for EffMaskSN = 1:NEffMask
    Items{EffMaskSN} = app.MaskInfo.EffectiveMaskPool{NonEmptyIdxInPool(EffMaskSN)}.MaskName;
    ItemsData{EffMaskSN} = num2str(NonEmptyIdxInPool(EffMaskSN));
end
Items = [{'None'} Items];
ItemsData = [{'0'} ItemsData];
app.EffectiveMaskSelectionDropDown.Items = Items;
app.EffectiveMaskSelectionDropDown.ItemsData = ItemsData;




