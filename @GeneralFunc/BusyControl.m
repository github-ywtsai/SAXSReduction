function BusyControl(app,event,Status)

% Menu
    % menu
MenuPart = [
        app.ImportMenu
        app.RawDataFileMenu
        app.ExportMenu
        app.SelectedprofilesindatastorageMenu
        app.CurrentallinfotomatfileMenu
        ];
% Buttons
ButtonPart = [
    % Background control
        app.BGDrawButton
        app.BGRemoveButton
        app.SaveCurrentDataAsBackgroundButton
    % Data storage
        app.PlotSelectedStoredDataButton
        app.ExportSelectedStoredDataButton
        app.DeleteSelectedStoredDataButton
        app.SelectUnselectAllButton
    % Mask generator
        app.MaskGenRefreshButton
        app.ExportMaskButton
    % multi-data-sheet data
        app.AvgMultiDataSheetButton
        app.ExportAvgMultiDataSheetButton
        app.PlotMultiDataSheetButton
        app.ExportMultiDataSheetButton
    % Effective mask control
        app.SaveCurrentMaskPreviewtoEffectiveMaskPoolButton
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
    % Background control
        app.BackgroundIDDropDown
    % Effective mask selection
        app.EffectiveMaskSelectionDropDown
];
% NumEditField
NumEditFieldPart = [
    % Background control
        app.SampleTransEditField
        app.BufferTransEditField
    % Average data
        %app.AvgDataStartSNEditField
        %app.AvgDataIncrementEditField
        %app.AvgDataEndSNEditField
];
% EditField
EditFieldPart = [
    % Average data
        %app.AvgDataSkipSNEditField
    % Effective mask control
        app.EffectiveMaskNameEditField
];

if Status % Busy
    [MenuPart(:).Enable] = deal('off');
    [ButtonPart(:).Enable] = deal('off');
    [RadioButtonPart(:).Enable] = deal('off');
    [SpinnerPart(:).Enable] = deal('off');
    [DropDownPart(:).Enable] = deal('off');
    [NumEditFieldPart(:).Enable] = deal('off');
    [EditFieldPart(:).Enable] = deal('off');
    [TablePart(:).Enable] = deal('off');
else % Release
    [MenuPart(:).Enable] = deal('on');
    [ButtonPart(:).Enable] = deal('on');
    [RadioButtonPart(:).Enable] = deal('on');
    [SpinnerPart(:).Enable] = deal('on');
    [DropDownPart(:).Enable] = deal('on');
    [NumEditFieldPart(:).Enable] = deal('on');
    [EditFieldPart(:).Enable] = deal('on');
    [TablePart(:).Enable] = deal('on');
end

if app.CurrentData.MasterInfo.DataSheetNum == 1
    app.CurrentDataSheetSpinner.Enable = 'off';
end
drawnow nocallbacks
