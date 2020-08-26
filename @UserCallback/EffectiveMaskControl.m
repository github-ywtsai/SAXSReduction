function EffectiveMaskControl(app,event)

if event.Source == app.SaveCurrentMaskPreviewtoEffectiveMaskPoolButton
    OPMode = 'Add';
elseif event.Source == app.EffectiveMaskListUITable
    if strcmpi(event.EventName,'CellEdit')
        if strcmpi(event.EditData,'Remove')
            OPMode = 'Remove';
        elseif strcmpi(event.EditData,'Cancel')
            OPMode = 'Cancel';
        end
    end
end

switch OPMode
    case 'Add'
        Save2EffectiveMaskPool(app,event);
    case 'Remove'
        RemoveEffectiveMaskPool(app,event);
end

UpdateEffectiveMaskPoolList(app,event);
GeneralFunc.UpdateEffectiveMaskTable(app,event);

function Save2EffectiveMaskPool(app,event)
EffMaskID = numel(app.MaskInfo.EffectiveMaskPool) + 1;
app.MaskInfo.EffectiveMaskPool{EffMaskID}.Mask = app.MaskInfo.EffectiveMaskPreview;
MaskName = app.EffectiveMaskNameEditField.Value;
if isempty(MaskName)
    MaskName = sprintf('Mask_%d',EffMaskID);
end
app.MaskInfo.EffectiveMaskPool{EffMaskID}.MaskName = MaskName;
app.EffectiveMaskNameEditField.Value = '';

function RemoveEffectiveMaskPool(app,event)
TargetEffectiveMaskID = event.Indices(1);
EffectiveMaskPoolNum = numel(app.MaskInfo.EffectiveMaskPool);
SelectedEffectiveMaskID = str2double(app.EffectiveMaskSelectionDropDown.Value);
if TargetEffectiveMaskID == SelectedEffectiveMaskID
    % do nothing but send a message
    Message = sprintf('Warning: The removement of the target effective mask %s is selected and locked. Unselect the target effective mask before removing.',app.MaskInfo.EffectiveMaskPool{TargetEffectiveMaskID}.MaskName);
    GeneralFunc.MessageControl(app,event,Message,'add');
elseif SelectedEffectiveMaskID > EffectiveMaskPoolNum
    return
elseif EffectiveMaskPoolNum == 0
    return
else
	app.MaskInfo.EffectiveMaskPool(TargetEffectiveMaskID) = [];
    if TargetEffectiveMaskID < SelectedEffectiveMaskID
        app.EffectiveMaskSelectionDropDown.Value = num2str(SelectedEffectiveMaskID-1);
    end
end



function UpdateEffectiveMaskPoolList(app,event)
EffectiveMaskPoolNum = numel(app.MaskInfo.EffectiveMaskPool);
% Effective Mask ID drowdown part
Items = cell(1,EffectiveMaskPoolNum);
ItemsData  = cell(1,EffectiveMaskPoolNum);
for EffMaskSN = 1:EffectiveMaskPoolNum
    Items{EffMaskSN} = sprintf('%d. %s',EffMaskSN,app.MaskInfo.EffectiveMaskPool{EffMaskSN}.MaskName);
    ItemsData{EffMaskSN} = num2str(EffMaskSN);
end

Items = [{'None'} Items];
ItemsData = [{'0'} ItemsData];
app.EffectiveMaskSelectionDropDown.Items = Items;
app.EffectiveMaskSelectionDropDown.ItemsData = ItemsData;
