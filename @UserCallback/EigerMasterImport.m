function EigerMasterImport(app,event)

SearchFile = fullfile(app.AdditionalInfo.Lasth5Folder,'*_master.h5');
[MasterFN,MasterFF] = uigetfile(SearchFile);

%% Master file selection canceled
if MasterFN == 0
    return
end

%% create MasterInfo, RawMasterInfo, ForceMasterInfo
app.AdditionalInfo.Lasth5Folder = MasterFF;
MasterFP = fullfile(MasterFF,MasterFN);
                        GeneralFunc.MessageControl(app,event,sprintf('Improting %s...',MasterFN),'add');
app.MasterInfo.Default = EigerDataFunc.ReadEigerHDF5Master(MasterFP);
                        GeneralFunc.MessageControl(app,event,sprintf('Improting %s...Done.',MasterFN),'replace');

if isempty(app.MasterInfo.UserDefine)
    app.MasterInfo.UserDefine = app.MasterInfo.Default;
end

%% transport to current data
if app.ParametersinProcessButtonGroup.SelectedObject == app.UserDefineButton
    app.CurrentData.MasterInfo = app.MasterInfo.UserDefine;
elseif app.ParametersinProcessButtonGroup.SelectedObject == app.DefaultButton
    app.CurrentData.MasterInfo = app.MasterInfo.Default;
end

%% Update data sheet selection and average page items High-Low limit
GeneralFunc.UpdateDataSheetSelectionItemsHLLimit(app,event);

%% Update Exp. Cond. Table
GeneralFunc.UpdateExpCondTableFromMasterInfo(app, event);

%% Create image to profile convertor
%% Update the effective pixel mask and effective mask
GeneralFunc.UpdateEffectiveMask(app, event);
% GeneralFunc.ImageProfileConfig(app,event) included within GeneralFunc.UpdateEffectiveMask(app, event);

%% Plot The First Data
UserCallback.DataSheetSelect(app,event);
