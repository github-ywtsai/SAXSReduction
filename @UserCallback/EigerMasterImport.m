function EigerMasterImport(app,event)

[MasterFN,MasterFF] = uigetfile('*_master.h5');

% Master file selection canceled
if MasterFN == 0
    return
end

MasterFP = fullfile(MasterFF,MasterFN);
app.CurrentData.MasterInfo = EigerDataFunc.ReadEigerHDF5Master(MasterFP);

GeneralFunc.UpdateDataSheetSelectionItems(app,event);