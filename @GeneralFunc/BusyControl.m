function BusyControl(app,event,Status)

if Status % Busy
    % Menu
    app.ImportMenu.Enable = 'Off';
    app.EigerMasterMenu.Enable = 'Off';
    app.ExportMenu.Enable = 'Off';
    app.CurrentallinfotomatfileMenu.Enable = 'Off';
    drawnow
    
    % Data select
    app.CurrentDataSheetSpinner.Enable = 'Off';
    drawnow
    
    % Mask control
    app.AddCSVMaskButton.Enable = 'Off';
    app.RemoveCSVMaskButton.Enable = 'Off';
    app.ActiveCSVMaskButton.Enable = 'Off';
    app.InvertCSVMaskButton.Enable = 'Off';
    app.CSVMaskUITable.Enable = 'Off';
    app.CSVMaskIDDropDown.Enable = 'Off';
    drawnow
    
    % Background control
    app.BGSetButton.Enable = 'Off';
    app.BGDrawButton.Enable = 'Off';
    app.BGRemoveButton.Enable = 'Off';
    app.SaveCurrentDataAsBackgroundButton.Enable = 'Off';
    app.BackgroundIDDropDown.Enable = 'Off';
    app.SampleTransEditField.Enable = 'Off';
    app.BufferTransEditField.Enable = 'Off';
    drawnow
    
    % Data storage
    app.DataStorageUITable.Enable  = 'Off';
    app.StoredDataIDDropDown.Enable = 'Off';
    app.StoreCurrentDataButton.Enable = 'Off';
    app.RemoveStoredDataButton.Enable = 'Off';
    app.PlotSelectStoredDataButton.Enable = 'Off';
    app.LoadDataButton.Enable = 'Off';
    drawnow
    
    % Mask generator
    app.RadiusMaskGenUITable.Enable = 'Off';
    app.MaskGenRefreshButton.Enable = 'Off';
    app.ExportMaskButton.Enable = 'Off';
    drawnow
    
    % Experimental condtions
    app.ExpCondUITable.Enable = 'Off';
    app.DefaultButton.Enable = 'Off';
    app.UserDefineButton.Enable = 'Off';
    drawnow
    
    % Average data
    app.AvgDataButton.Enable = 'Off';
    app.AvgDataStartSNEditField.Enable = 'Off';
    app.AvgDataIncrementEditField.Enable = 'Off';
    app.AvgDataEndSNEditField.Enable = 'Off';
    app.AvgDataSkipSNEditField.Enable = 'Off';
    drawnow
    
else % Release
    % Menu
    app.ImportMenu.Enable = 'On';
    app.EigerMasterMenu.Enable = 'On';
    app.ExportMenu.Enable = 'On';
    app.CurrentallinfotomatfileMenu.Enable = 'On';
    
    drawnow
    
    % Data select
    app.CurrentDataSheetSpinner.Enable = 'On';
    drawnow
    
    % Mask control
    app.AddCSVMaskButton.Enable = 'On';
    app.RemoveCSVMaskButton.Enable = 'On';
    app.ActiveCSVMaskButton.Enable = 'On';
    app.InvertCSVMaskButton.Enable = 'On';
    app.CSVMaskUITable.Enable = 'On';
    app.CSVMaskIDDropDown.Enable = 'On';
    drawnow
    
    % Background control
    app.BGSetButton.Enable = 'On';
    app.BGDrawButton.Enable = 'On';
    app.BGRemoveButton.Enable = 'On';
    app.SaveCurrentDataAsBackgroundButton.Enable = 'On';
    app.BackgroundIDDropDown.Enable = 'On';
    app.SampleTransEditField.Enable = 'On';
    app.BufferTransEditField.Enable = 'On';
    drawnow
    
    % Data storage
    app.DataStorageUITable.Enable  = 'On';
    app.StoredDataIDDropDown.Enable = 'On';
    app.StoreCurrentDataButton.Enable = 'On';
    app.RemoveStoredDataButton.Enable = 'On';
    app.PlotSelectStoredDataButton.Enable = 'On';
    app.LoadDataButton.Enable = 'On';
    drawnow
    
    % Mask generator
    app.RadiusMaskGenUITable.Enable = 'On';
    app.MaskGenRefreshButton.Enable = 'On';
    app.ExportMaskButton.Enable = 'On';
    drawnow
    
    % Experimental condtions
    app.ExpCondUITable.Enable = 'On';
    app.DefaultButton.Enable = 'On';
    app.UserDefineButton.Enable = 'On';
    drawnow
    
    % Average data
    app.AvgDataButton.Enable = 'On';
    app.AvgDataStartSNEditField.Enable = 'On';
    app.AvgDataIncrementEditField.Enable = 'On';
    app.AvgDataEndSNEditField.Enable = 'On';
    app.AvgDataSkipSNEditField.Enable = 'On';
    drawnow
end
