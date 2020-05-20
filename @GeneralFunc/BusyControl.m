function BusyControl(app,event,Status)

if Status % Busy
    % Menu
    app.ImportMenu.Enable = 'Off';
    app.EigerMasterMenu.Enable = 'Off';
    app.ExportMenu.Enable = 'Off';
    app.CurrentallinfotomatfileMenu.Enable = 'Off';
    
    % Data select
    app.CurrentDataSheetSpinner.Enable = 'Off';
    
    % Mask control
    app.AddCSVMaskButton.Enable = 'Off';
    app.RemoveCSVMaskButton.Enable = 'Off';
    app.ActiveCSVMaskButton.Enable = 'Off';
    app.InvertCSVMaskButton.Enable = 'Off';
    app.CSVMaskUITable.Enable = 'Off';
    
    % Background control
    app.BGSetButton.Enable = 'Off';
    app.BGDrawButton.Enable = 'Off';
    app.BGRemoveButton.Enable = 'Off';
    app.SaveCurrentDataAsBackgroundButton.Enable = 'Off';
    app.BackgroundIDDropDown.Enable = 'Off';
    app.SampleTransEditField.Enable = 'Off';
    app.BufferTransEditField.Enable = 'Off';
    
    % Data storage
    app.DataStorageUITable.Enable  = 'Off';
    app.StoredDataIDDropDown.Enable = 'Off';
    app.StoreCurrentDataButton.Enable = 'Off';
    app.RemoveStoredDataButton.Enable = 'Off';
    app.PlotSelectStoredDataButton.Enable = 'Off';
    app.LoadDataButton.Enable = 'Off';
else % Release
        % Menu
    app.ImportMenu.Enable = 'On';
    app.EigerMasterMenu.Enable = 'On';
    app.ExportMenu.Enable = 'On';
    app.CurrentallinfotomatfileMenu.Enable = 'On';
    
    % Data select
    app.CurrentDataSheetSpinner.Enable = 'On';
    
    % Mask control
    app.AddCSVMaskButton.Enable = 'On';
    app.RemoveCSVMaskButton.Enable = 'On';
    app.ActiveCSVMaskButton.Enable = 'On';
    app.InvertCSVMaskButton.Enable = 'On';
    app.CSVMaskUITable.Enable = 'On';
    
    % Background control
    app.BGSetButton.Enable = 'On';
    app.BGDrawButton.Enable = 'On';
    app.BGRemoveButton.Enable = 'On';
    app.SaveCurrentDataAsBackgroundButton.Enable = 'On';
    app.BackgroundIDDropDown.Enable = 'On';
    app.SampleTransEditField.Enable = 'On';
    app.BufferTransEditField.Enable = 'On';
    
    % Data storage
    app.DataStorageUITable.Enable  = 'On';
    app.StoredDataIDDropDown.Enable = 'On';
    app.StoreCurrentDataButton.Enable = 'On';
    app.RemoveStoredDataButton.Enable = 'On';
    app.PlotSelectStoredDataButton.Enable = 'On';
    app.LoadDataButton.Enable = 'On';
    
end

drawnow