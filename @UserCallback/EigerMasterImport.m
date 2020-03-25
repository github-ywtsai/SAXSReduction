function EigerMasterImport(app,event)

[MasterFN,MasterFF] = uigetfile('*_master.h5');

%% Master file selection canceled
if MasterFN == 0
    return
end

%% create MasterInfo, RawMasterInfo, ForceMasterInfo
MasterFP = fullfile(MasterFF,MasterFN);
app.MasterInfo.Default = EigerDataFunc.ReadEigerHDF5Master(MasterFP);

if isempty(app.MasterInfo.UserDefine)
    app.MasterInfo.UserDefine = app.MasterInfo.Default;
end

%% transport to current data
app.CurrentData.MasterInfo = app.MasterInfo.Default;

%% Update data sheet selection items
GeneralFunc.UpdateDataSheetSelectionItems(app,event);

%% Update Exp. Cond. Table
GeneralFunc.UpdateExpCondTableFromMasterInfo(app, event);

%% Create image to profile convertor
%% Update the effective pixel mask and effective mask
GeneralFunc.UpdateEffectiveMask(app, event);
% GeneralFunc.ImageProfileConfig(app,event) included within GeneralFunc.UpdateEffectiveMask(app, event);

%% Plot The First Data
UserCallback.DataSheetSelect(app,event);
