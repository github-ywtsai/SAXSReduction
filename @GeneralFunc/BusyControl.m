function BusyControl(app,event,Status)

% Menu
    % menu
MenuPart = [
        app.ImportMenu
        app.EigerMasterMenu
        app.ExportMenu
        app.CurrentallinfotomatfileMenu
        ];
% Buttons
ButtonPart = [
    % Mask control
        app.AddCSVMaskButton
        app.RemoveCSVMaskButton
        app.ActiveCSVMaskButton
        app.InvertCSVMaskButton
    % Background control
        app.BGSetButton
        app.BGDrawButton
        app.BGRemoveButton
        app.SaveCurrentDataAsBackgroundButton
    % Data storage
        app.StoreCurrentDataButton
        app.RemoveStoredDataButton
        app.PlotSelectStoredDataButton
        app.LoadDataButton
    % Mask generator
        app.MaskGenRefreshButton
        app.ExportMaskButton
    % Average data
        app.AvgDataButton
    % Effective mask control
        app.SaveMaskPreviewButton
        app.RemoveMaskPreviewButton
];
% RadioButton
RadioButtonPart = [
    % Experimental conditions
        app.DefaultButton
        app.UserDefineButton
];
% Spinner
SpinnerPart = [
    % Data select
        app.CurrentDataSheetSpinner
];
% Table
TablePart = [
    % Mask control
        app.CSVMaskUITable
    % Data storage
        app.DataStorageUITable
    % Mask generator
        app.RadiusMaskGenUITable
    % Experimental condtions
        app.ExpCondUITable
];
% Dropdown
DropDownPart = [
    % Mask control
        app.CSVMaskIDDropDown
    % Background control
        app.BackgroundIDDropDown
    % Data storage
        app.StoredDataIDDropDown
    % Effective mask selection
        app.EffectiveMaskSelectionDropDown
    % Effective mask control
        app.EffectiveMaskIDDropDown
];
% NumEditField
NumEditFieldPart = [
    % Background control
        app.SampleTransEditField
        app.BufferTransEditField
    % Average data
        app.AvgDataStartSNEditField
        app.AvgDataIncrementEditField
        app.AvgDataEndSNEditField
    % Data storage offset/magnitude
        app.StoredDataOffsetEditField
        app.StoredDataMagnificationEditField
];
% EditField
EditFieldPart = [
    % Average data
        app.AvgDataSkipSNEditField
    % Effective mask control
        app.EffectiveMaskNameEditField
];

if Status % Busy
[MenuPart(:).Enable] = deal('off');
[ButtonPart(:).Enable] = deal('off');
[RadioButtonPart(:).Enable] = deal('off');
[SpinnerPart(:).Enable] = deal('off');
[TablePart(:).Enable] = deal('off');
[DropDownPart(:).Enable] = deal('off');
[NumEditFieldPart(:).Enable] = deal('off');
[EditFieldPart(:).Enable] = deal('off');
else % Release
[MenuPart(:).Enable] = deal('on');
[ButtonPart(:).Enable] = deal('on');
[RadioButtonPart(:).Enable] = deal('on');
[SpinnerPart(:).Enable] = deal('on');
[TablePart(:).Enable] = deal('on');
[DropDownPart(:).Enable] = deal('on');
[NumEditFieldPart(:).Enable] = deal('on');
[EditFieldPart(:).Enable] = deal('on');
end
drawnow nocallbacks
