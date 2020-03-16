function EigerMasterImport(app,event)

[MasterFN,MasterFF] = uigetfile('*_master.h5');

%% Master file selection canceled
if MasterFN == 0
    return
end

%% create MasterInfo, RawMasterInfo, ForceMasterInfo
MasterFP = fullfile(MasterFF,MasterFN);
app.CurrentData.MasterInfo = EigerDataFunc.ReadEigerHDF5Master(MasterFP);
app.CurrentData.DefaultMasterInfo = app.CurrentData.MasterInfo;

if isempty(app.CurrentData.UserDefineMasterInfo)
    app.CurrentData.UserDefineMasterInfo = app.CurrentData.DefaultMasterInfo;
end

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
