classdef SAXSReduction < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        SAXSReductionUIFigure           matlab.ui.Figure
        ImportMenu                      matlab.ui.container.Menu
        RawDataFileMenu                 matlab.ui.container.Menu
        ExportMenu                      matlab.ui.container.Menu
        CurrentallinfotomatfileMenu     matlab.ui.container.Menu
        MainTabGroup                    matlab.ui.container.TabGroup
        ImageTab                        matlab.ui.container.Tab
        ImageUIAxes                     matlab.ui.control.UIAxes
        ImageIntensityScaleButtonGroup  matlab.ui.container.ButtonGroup
        ImageIntensityLogButton         matlab.ui.control.RadioButton
        ImageIntensityLinearButton      matlab.ui.control.RadioButton
        ColormapDropDownLabel           matlab.ui.control.Label
        ColormapDropDown                matlab.ui.control.DropDown
        IntensityRangeButtonGroup       matlab.ui.container.ButtonGroup
        ImgIntensityRangeAutoButton     matlab.ui.control.RadioButton
        ImgIntensityRangeManualButton   matlab.ui.control.RadioButton
        HighThresholdSliderLabel        matlab.ui.control.Label
        HighThresholdSlider             matlab.ui.control.Slider
        LowThresholdSliderLabel         matlab.ui.control.Label
        LowThresholdSlider              matlab.ui.control.Slider
        ExportCurrentImageButton        matlab.ui.control.Button
        ProfileTab                      matlab.ui.container.Tab
        ProfileUIAxes                   matlab.ui.control.UIAxes
        ProfileXAxisScaleButtonGroup    matlab.ui.container.ButtonGroup
        ProfileXAxisLogButton           matlab.ui.control.RadioButton
        ProfileXAxisLinearButton        matlab.ui.control.RadioButton
        ProfileYAxisScaleButtonGroup    matlab.ui.container.ButtonGroup
        ProfileYAxisLogButton           matlab.ui.control.RadioButton
        ProfileYAxisLinearButton        matlab.ui.control.RadioButton
        XAxisResolutionButtonGroup      matlab.ui.container.ButtonGroup
        XAxisOnePixelResButton          matlab.ui.control.RadioButton
        XAxisPointsResButton            matlab.ui.control.RadioButton
        XAxisPoints                     matlab.ui.control.NumericEditField
        XAxisUnitButtonGroup            matlab.ui.container.ButtonGroup
        qXAxisUnitButton                matlab.ui.control.RadioButton
        tthXAxisUnitButton              matlab.ui.control.RadioButton
        ExportcurrentprofileButton      matlab.ui.control.Button
        MaskConfigTab                   matlab.ui.container.Tab
        EffectiveMaskPreviewUIAxes      matlab.ui.control.UIAxes
        CSVMaskUITable                  matlab.ui.control.Table
        SaveCurrentMaskPreviewtoEffectiveMaskPoolButton  matlab.ui.control.Button
        EffectiveMaskNameEditFieldLabel  matlab.ui.control.Label
        EffectiveMaskNameEditField      matlab.ui.control.EditField
        EffectiveMaskListUITable        matlab.ui.control.Table
        RegionofInterestTab             matlab.ui.container.Tab
        MaskPreviewUIAxes               matlab.ui.control.UIAxes
        MaskGenTabGroup                 matlab.ui.container.TabGroup
        RadiusMaskGenTab                matlab.ui.container.Tab
        RadiusMaskGenUITable            matlab.ui.control.Table
        RectangleMaskGenTab             matlab.ui.container.Tab
        RectangleMaskGenUITable         matlab.ui.control.Table
        SaveROIButton                   matlab.ui.control.Button
        MaskGenSymmetryButtonGroup      matlab.ui.container.ButtonGroup
        MaskGenNoneSymButton            matlab.ui.control.RadioButton
        MaskGenCenSymButton             matlab.ui.control.RadioButton
        MaskGenXMirrorButton            matlab.ui.control.RadioButton
        MaskGenYMirrorButton            matlab.ui.control.RadioButton
        MaskGenRefreshButton            matlab.ui.control.Button
        ROIListUITable                  matlab.ui.control.Table
        ROINameEditFieldLabel           matlab.ui.control.Label
        ROINameEditField                matlab.ui.control.EditField
        ExperimentalConditionsTab       matlab.ui.container.Tab
        ParametersinProcessButtonGroup  matlab.ui.container.ButtonGroup
        DefaultButton                   matlab.ui.control.RadioButton
        UserDefineButton                matlab.ui.control.RadioButton
        ExpCondUITable                  matlab.ui.control.Table
        MultiProfileTab                 matlab.ui.container.Tab
        MultiProfileUIAxes              matlab.ui.control.UIAxes
        MultiProfileXAxisScaleButtonGroup  matlab.ui.container.ButtonGroup
        MultiProfileXAxisLogButton      matlab.ui.control.RadioButton
        MultiProfileXAxisLinearButton   matlab.ui.control.RadioButton
        MultiProfileYAxisScaleButtonGroup  matlab.ui.container.ButtonGroup
        MultiProfileYAxisLogButton      matlab.ui.control.RadioButton
        MultiProfileYAxisLinearButton   matlab.ui.control.RadioButton
        PoleFigureTab                   matlab.ui.container.Tab
        PoleFigureUIAxes                matlab.ui.control.UIAxes
        PoleFigureGeometeryButtonGroup  matlab.ui.container.ButtonGroup
        IncidentAngleButton             matlab.ui.control.RadioButton
        ReflectionPointButton           matlab.ui.control.RadioButton
        IncidentAngleEditField          matlab.ui.control.NumericEditField
        ReflectionXEditField            matlab.ui.control.NumericEditField
        ReflectionYEditField            matlab.ui.control.NumericEditField
        PlotingConfigurationPanel       matlab.ui.container.Panel
        qzminEditFieldLabel             matlab.ui.control.Label
        qzminEditField                  matlab.ui.control.NumericEditField
        qzmaxEditFieldLabel             matlab.ui.control.Label
        qzmaxEditField                  matlab.ui.control.NumericEditField
        qrminEditFieldLabel             matlab.ui.control.Label
        qrminEditField                  matlab.ui.control.NumericEditField
        qrmaxEditFieldLabel             matlab.ui.control.Label
        qrmaxEditField                  matlab.ui.control.NumericEditField
        TabGroup2                       matlab.ui.container.TabGroup
        DataStorageTab                  matlab.ui.container.Tab
        TabGroup5                       matlab.ui.container.TabGroup
        SelectionControlTab             matlab.ui.container.Tab
        ExportSelectedStoredDataButton  matlab.ui.control.Button
        PlotSelectedStoredDataButton    matlab.ui.control.Button
        DeleteSelectedStoredDataButton  matlab.ui.control.Button
        SelectUnselectAllButton         matlab.ui.control.Button
        StoredDataOffsetMagnificationTab  matlab.ui.container.Tab
        OffsetEditFieldLabel            matlab.ui.control.Label
        StoredDataOffsetEditField       matlab.ui.control.NumericEditField
        MagnificationEditFieldLabel     matlab.ui.control.Label
        StoredDataMagnificationEditField  matlab.ui.control.NumericEditField
        TargetProfileLabel              matlab.ui.control.Label
        TargetStoredDataDropDown        matlab.ui.control.DropDown
        DataStorageUITable              matlab.ui.control.Table
        TabGroup4                       matlab.ui.container.TabGroup
        MessageTab                      matlab.ui.container.Tab
        MessageTextArea                 matlab.ui.control.TextArea
        UserControlTabGroup             matlab.ui.container.TabGroup
        DataSheetSelectionTab           matlab.ui.container.Tab
        CurrentDataSheetSpinner         matlab.ui.control.Spinner
        CurrentDataSheetReDrawButton    matlab.ui.control.Button
        BackgroundConfigurationPanel    matlab.ui.container.Panel
        BackgroundIDDropDownLabel       matlab.ui.control.Label
        BackgroundIDDropDown            matlab.ui.control.DropDown
        BGDrawButton                    matlab.ui.control.Button
        SaveCurrentDataAsBackgroundButton  matlab.ui.control.Button
        SampleTransEditFieldLabel       matlab.ui.control.Label
        SampleTransEditField            matlab.ui.control.NumericEditField
        BufferTransEditFieldLabel       matlab.ui.control.Label
        BufferTransEditField            matlab.ui.control.NumericEditField
        BGRemoveButton                  matlab.ui.control.Button
        EffectiveMaskSelectionPanel     matlab.ui.container.Panel
        EffectiveMaskSelectionDropDown  matlab.ui.control.DropDown
        SaturationEliminationCheckBox   matlab.ui.control.CheckBox
        ROISelectionPanel               matlab.ui.container.Panel
        ROISelectionDropDown            matlab.ui.control.DropDown
        MultiDataSheetProcessingTab     matlab.ui.container.Tab
        StartEditFieldLabel             matlab.ui.control.Label
        MultiDataStartSNEditField       matlab.ui.control.NumericEditField
        IncrementEditFieldLabel         matlab.ui.control.Label
        MultiDataIncrementEditField     matlab.ui.control.NumericEditField
        EndEditFieldLabel               matlab.ui.control.Label
        MultiDataEndSNEditField         matlab.ui.control.NumericEditField
        AvgMultiDataSheetButton         matlab.ui.control.Button
        SkipDataSheetEditFieldLabel     matlab.ui.control.Label
        MultiDataSkipSNEditField        matlab.ui.control.EditField
        PlotMultiDataSheetButton        matlab.ui.control.Button
        ExportAvgMultiDataSheetButton   matlab.ui.control.Button
        ExportMultiDataSheetButton      matlab.ui.control.Button
    end

    
    properties (Access = public)
        CurrentData % Save data for ploting
        DataStorage % Data keeped
        MasterInfo % Master infomation
        BGInfo % Store backgrounds
        MaskInfo % mask information
        PlotHandles % Handles for plots
        MaskGen % Mask genarator parameters
        MessageStorage % Message-history storage
        AdditionalInfo % Others information for program
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            GeneralFunc.PresetVariables(app);
            GeneralFunc.UpdateCSVMaskTable(app,[]);
            GeneralFunc.UpdateDataStorageTable(app,[]);
            GeneralFunc.UpdateEffectiveMaskTable(app,[]);
            
            EnvSettingCheck = GeneralFunc.EnvSetting();
            if ~EnvSettingCheck
                closereq
                return
            end
            app.AdditionalInfo.Lasth5Folder = pwd;
            app.AdditionalInfo.LastDataExportFolder = pwd;
            app.AdditionalInfo.LastMaskExportFolder = pwd;
            app.AdditionalInfo.LastMaskImportFolder = pwd;
        end

        % Menu selected function: RawDataFileMenu
        function RawDataFileMenuSelected(app, event)
            UserCallback.EigerMasterImport(app,event);
        end

        % Callback function: CurrentDataSheetReDrawButton, 
        % CurrentDataSheetSpinner
        function CurrentDataSheetSpinnerValueChanged(app, event)
            % value = app.CurrentDataSheetSpinner.Value;
            UserCallback.DataSheetSelect(app,event);
        end

        % Selection changed function: ParametersinProcessButtonGroup
        function ParametersinProcessButtonGroupSelectionChanged(app, event)
            % selectedButton = app.ParametersinProcessButtonGroup.SelectedObject;
            GeneralFunc.UpdateMasterInfoFromTable(app,event);
            GeneralFunc.ImageProfileConfig(app,event);
            GeneralFunc.SingleDataProcess(app,event);
            GeneralFunc.PlotCurrentImage(app,event);
            GeneralFunc.PlotCurrentProfile(app,event);
        end

        % Cell edit callback: ExpCondUITable
        function ExpCondUITableCellEdit(app, event)
            % indices = event.Indices;
            % newData = event.NewData;
            GeneralFunc.UpdateMasterInfoFromTable(app, event);      
        end

        % Callback function: ColormapDropDown, HighThresholdSlider, 
        % HighThresholdSlider, ImageIntensityScaleButtonGroup, 
        % IntensityRangeButtonGroup, LowThresholdSlider, 
        % LowThresholdSlider
        function ImageIntensityScaleButtonGroupSelectionChanged(app, event)
            % selectedButton = app.ImageIntensityScaleButtonGroup.SelectedObject;
            UserCallback.ImgAppearanceControl(app,event);
        end

        % Button pushed function: SaveROIButton
        function SaveROIButtonPushed(app, event)
            UserCallback.ExportCSVMask(app,event);
        end

        % Cell edit callback: RadiusMaskGenUITable, 
        % RectangleMaskGenUITable
        function RadiusMaskGenUITableCellEdit(app, event)
            % indices = event.Indices;
            % newData = event.NewData;
            GeneralFunc.MaskGenerator(app,event);
            GeneralFunc.MaskGenPreview(app,event);
        end

        % Selection changed function: MaskGenSymmetryButtonGroup
        function MaskGenSymmetryButtonGroupSelectionChanged(app, event)
            % selectedButton = app.MaskGenSymmetryButtonGroup.SelectedObject;
            GeneralFunc.MaskGenerator(app,event);
            GeneralFunc.MaskGenPreview(app,event);
        end

        % Button pushed function: MaskGenRefreshButton
        function MaskGenRefreshButtonPushed(app, event)
            GeneralFunc.MaskGenerator(app,event);
            GeneralFunc.MaskGenPreview(app,event);
        end

        % Button pushed function: AvgMultiDataSheetButton, 
        % ExportAvgMultiDataSheetButton
        function AvgMultiDataSheetButtonPushed(app, event)
            UserCallback.AverageData(app,event);
        end

        % Selection changed function: XAxisResolutionButtonGroup
        function XAxisResolutionButtonGroupSelectionChanged(app, event)
            % selectedButton = app.XAxisResolutionButtonGroup.SelectedObject;
            GeneralFunc.ImageProfileConfig(app,event);
            GeneralFunc.SingleDataProcess(app,event);
            GeneralFunc.PlotCurrentImage(app,event);
            GeneralFunc.PlotCurrentProfile(app,event);
        end

        % Value changed function: XAxisPoints
        function XAxisPointsValueChanged(app, event)
            % value = app.XAxisPoints.Value;
            GeneralFunc.ImageProfileConfig(app,event);
            GeneralFunc.SingleDataProcess(app,event);
            GeneralFunc.PlotCurrentImage(app,event);
            GeneralFunc.PlotCurrentProfile(app,event);
        end

        % Button pushed function: ExportcurrentprofileButton
        function CurrentProfileMenuSelected(app, event)
            UserCallback.ExportCurrentProfile(app,event);
        end

        % Selection changed function: XAxisUnitButtonGroup
        function XAxisUnitButtonGroupSelectionChanged(app, event)
            % selectedButton = app.XAxisUnitButtonGroup.SelectedObject;
            GeneralFunc.ImageProfileConfig(app,event);
            GeneralFunc.SingleDataProcess(app,event);
            GeneralFunc.PlotCurrentImage(app,event);
            GeneralFunc.PlotCurrentProfile(app,event);
        end

        % Menu selected function: CurrentallinfotomatfileMenu
        function CurrentallinfotomatfileMenuSelected(app, event)
            UserCallback.ExportAll2mat(app,event);
        end

        % Value changed function: EffectiveMaskSelectionDropDown
        function EffectiveMaskSelectionDropDownValueChanged(app, event)
            % value = app.EffectiveMaskSelectionDropDown.Value;
            UserCallback.EffectiveMaskSelection(app,event);
        end

        % Selection change function: MainTabGroup
        function MainTabGroupSelectionChanged(app, event)
            % selectedTab = app.MainTabGroup.SelectedTab;
            UserCallback.MainTabSelection(app,event);
        end

        % Cell edit callback: CSVMaskUITable
        function CSVMaskUITableCellEdit(app, event)
            % indices = event.Indices;
            % newData = event.NewData;
            UserCallback.CSVMaskControl(app, event);
        end

        % Cell edit callback: DataStorageUITable
        function DataStorageUITableCellEdit(app, event)
            %indices = event.Indices;
            %newData = event.NewData;
            UserCallback.DataStorageControl(app,event);
        end

        % Value changed function: StoredDataMagnificationEditField, 
        % StoredDataOffsetEditField, TargetStoredDataDropDown
        function TargetStoredDataDropDownValueChanged(app, event)
            % value = app.TargetStoredDataDropDown.Value;
            UserCallback.StoredDataOffsetMagControl(app,event);
        end

        % Button pushed function: ExportMultiDataSheetButton, 
        % PlotMultiDataSheetButton
        function PlotMultiDataSheetButtonPushed(app, event)
            UserCallback.PlotMultiDataSheet(app,event);
        end

        % Selection changed function: 
        % MultiProfileXAxisScaleButtonGroup, 
        % MultiProfileYAxisScaleButtonGroup, 
        % ProfileXAxisScaleButtonGroup, ProfileYAxisScaleButtonGroup
        function ProfileXAxisScaleButtonGroupSelectionChanged(app, event)
            % selectedButton = app.ProfileXAxisScaleButtonGroup.SelectedObject;
            UserCallback.ProfileAxesControl(app,event);
        end

        % Button pushed function: DeleteSelectedStoredDataButton, 
        % ExportSelectedStoredDataButton, 
        % PlotSelectedStoredDataButton, SelectUnselectAllButton
        function ExportSelectedStoredDataButtonPushed(app, event)
            UserCallback.StoredDataControl(app,event);
        end

        % Callback function: BGDrawButton, BGRemoveButton, 
        % BackgroundIDDropDown, BufferTransEditField, 
        % SampleTransEditField, SaveCurrentDataAsBackgroundButton
        function SaveCurrentDataAsBackgroundButtonPushed(app, event)
            UserCallback.BackgroundControl(app,event);
        end

        % Callback function: EffectiveMaskListUITable, 
        % SaveCurrentMaskPreviewtoEffectiveMaskPoolButton
        function SaveCurrentMaskPreviewtoEffectiveMaskPoolButtonPushed(app, event)
            UserCallback.EffectiveMaskControl(app,event);
        end

        % Button pushed function: ExportCurrentImageButton
        function ExportCurrentImageButtonPushed(app, event)
            UserCallback.ExportCurrentImage(app,event);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create SAXSReductionUIFigure and hide until all components are created
            app.SAXSReductionUIFigure = uifigure('Visible', 'off');
            app.SAXSReductionUIFigure.Position = [100 100 1160 730];
            app.SAXSReductionUIFigure.Name = 'SAXSReduction';

            % Create ImportMenu
            app.ImportMenu = uimenu(app.SAXSReductionUIFigure);
            app.ImportMenu.Text = 'Import';

            % Create RawDataFileMenu
            app.RawDataFileMenu = uimenu(app.ImportMenu);
            app.RawDataFileMenu.MenuSelectedFcn = createCallbackFcn(app, @RawDataFileMenuSelected, true);
            app.RawDataFileMenu.Text = 'Raw Data File';

            % Create ExportMenu
            app.ExportMenu = uimenu(app.SAXSReductionUIFigure);
            app.ExportMenu.Text = 'Export';

            % Create CurrentallinfotomatfileMenu
            app.CurrentallinfotomatfileMenu = uimenu(app.ExportMenu);
            app.CurrentallinfotomatfileMenu.MenuSelectedFcn = createCallbackFcn(app, @CurrentallinfotomatfileMenuSelected, true);
            app.CurrentallinfotomatfileMenu.Text = 'Current all info. to mat file';

            % Create MainTabGroup
            app.MainTabGroup = uitabgroup(app.SAXSReductionUIFigure);
            app.MainTabGroup.SelectionChangedFcn = createCallbackFcn(app, @MainTabGroupSelectionChanged, true);
            app.MainTabGroup.Position = [10 10 830 710];

            % Create ImageTab
            app.ImageTab = uitab(app.MainTabGroup);
            app.ImageTab.Title = 'Image';

            % Create ImageUIAxes
            app.ImageUIAxes = uiaxes(app.ImageTab);
            title(app.ImageUIAxes, 'Title')
            xlabel(app.ImageUIAxes, 'X')
            ylabel(app.ImageUIAxes, 'Y')
            app.ImageUIAxes.DataAspectRatio = [1 1 1];
            app.ImageUIAxes.Position = [10 140 530 530];

            % Create ImageIntensityScaleButtonGroup
            app.ImageIntensityScaleButtonGroup = uibuttongroup(app.ImageTab);
            app.ImageIntensityScaleButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ImageIntensityScaleButtonGroupSelectionChanged, true);
            app.ImageIntensityScaleButtonGroup.Title = 'Intensity Scale/ Colormap';
            app.ImageIntensityScaleButtonGroup.Position = [578 563 240 96];

            % Create ImageIntensityLogButton
            app.ImageIntensityLogButton = uiradiobutton(app.ImageIntensityScaleButtonGroup);
            app.ImageIntensityLogButton.Text = 'Log';
            app.ImageIntensityLogButton.Position = [11 50 58 22];
            app.ImageIntensityLogButton.Value = true;

            % Create ImageIntensityLinearButton
            app.ImageIntensityLinearButton = uiradiobutton(app.ImageIntensityScaleButtonGroup);
            app.ImageIntensityLinearButton.Text = 'Linear';
            app.ImageIntensityLinearButton.Position = [116 50 65 22];

            % Create ColormapDropDownLabel
            app.ColormapDropDownLabel = uilabel(app.ImageIntensityScaleButtonGroup);
            app.ColormapDropDownLabel.HorizontalAlignment = 'right';
            app.ColormapDropDownLabel.Position = [6 29 58 22];
            app.ColormapDropDownLabel.Text = 'Colormap';

            % Create ColormapDropDown
            app.ColormapDropDown = uidropdown(app.ImageIntensityScaleButtonGroup);
            app.ColormapDropDown.Items = {'albula', 'parula', 'jet', 'hsv', 'hot', 'cool', 'spring', 'summer', 'autumn', 'winter', 'gray', 'bone', 'copper', 'pink'};
            app.ColormapDropDown.ValueChangedFcn = createCallbackFcn(app, @ImageIntensityScaleButtonGroupSelectionChanged, true);
            app.ColormapDropDown.Position = [11 8 223 22];
            app.ColormapDropDown.Value = 'albula';

            % Create IntensityRangeButtonGroup
            app.IntensityRangeButtonGroup = uibuttongroup(app.ImageTab);
            app.IntensityRangeButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ImageIntensityScaleButtonGroupSelectionChanged, true);
            app.IntensityRangeButtonGroup.Title = 'Intensity Range';
            app.IntensityRangeButtonGroup.Position = [578 362 240 195];

            % Create ImgIntensityRangeAutoButton
            app.ImgIntensityRangeAutoButton = uiradiobutton(app.IntensityRangeButtonGroup);
            app.ImgIntensityRangeAutoButton.Text = 'Auto';
            app.ImgIntensityRangeAutoButton.Position = [11 149 58 22];
            app.ImgIntensityRangeAutoButton.Value = true;

            % Create ImgIntensityRangeManualButton
            app.ImgIntensityRangeManualButton = uiradiobutton(app.IntensityRangeButtonGroup);
            app.ImgIntensityRangeManualButton.Text = 'Manual';
            app.ImgIntensityRangeManualButton.Position = [115 149 65 22];

            % Create HighThresholdSliderLabel
            app.HighThresholdSliderLabel = uilabel(app.IntensityRangeButtonGroup);
            app.HighThresholdSliderLabel.HorizontalAlignment = 'right';
            app.HighThresholdSliderLabel.Position = [7 126 87 22];
            app.HighThresholdSliderLabel.Text = 'High Threshold';

            % Create HighThresholdSlider
            app.HighThresholdSlider = uislider(app.IntensityRangeButtonGroup);
            app.HighThresholdSlider.Limits = [-1 7];
            app.HighThresholdSlider.MajorTicks = [-1 0 1 2 3 4 5 6 7];
            app.HighThresholdSlider.MajorTickLabels = {'0', '1', '10', '1E2', '1E3', '1E4', '1E5', '1E6', '1E7'};
            app.HighThresholdSlider.ValueChangedFcn = createCallbackFcn(app, @ImageIntensityScaleButtonGroupSelectionChanged, true);
            app.HighThresholdSlider.ValueChangingFcn = createCallbackFcn(app, @ImageIntensityScaleButtonGroupSelectionChanged, true);
            app.HighThresholdSlider.Enable = 'off';
            app.HighThresholdSlider.Position = [18 114 205 3];
            app.HighThresholdSlider.Value = 7;

            % Create LowThresholdSliderLabel
            app.LowThresholdSliderLabel = uilabel(app.IntensityRangeButtonGroup);
            app.LowThresholdSliderLabel.HorizontalAlignment = 'right';
            app.LowThresholdSliderLabel.Position = [6 50 84 22];
            app.LowThresholdSliderLabel.Text = 'Low Threshold';

            % Create LowThresholdSlider
            app.LowThresholdSlider = uislider(app.IntensityRangeButtonGroup);
            app.LowThresholdSlider.Limits = [-1 7];
            app.LowThresholdSlider.MajorTicks = [-1 0 1 2 3 4 5 6 7];
            app.LowThresholdSlider.MajorTickLabels = {'0', '1', '10', '100', '1E3', '1E4', '1E5', '1E6', '1E7', '2', '3', '4', '5', '6', ''};
            app.LowThresholdSlider.ValueChangedFcn = createCallbackFcn(app, @ImageIntensityScaleButtonGroupSelectionChanged, true);
            app.LowThresholdSlider.ValueChangingFcn = createCallbackFcn(app, @ImageIntensityScaleButtonGroupSelectionChanged, true);
            app.LowThresholdSlider.Enable = 'off';
            app.LowThresholdSlider.Position = [14 38 209 3];
            app.LowThresholdSlider.Value = -1;

            % Create ExportCurrentImageButton
            app.ExportCurrentImageButton = uibutton(app.ImageTab, 'push');
            app.ExportCurrentImageButton.ButtonPushedFcn = createCallbackFcn(app, @ExportCurrentImageButtonPushed, true);
            app.ExportCurrentImageButton.Position = [578 332 240 22];
            app.ExportCurrentImageButton.Text = 'Export Current Image';

            % Create ProfileTab
            app.ProfileTab = uitab(app.MainTabGroup);
            app.ProfileTab.Title = 'Profile';

            % Create ProfileUIAxes
            app.ProfileUIAxes = uiaxes(app.ProfileTab);
            title(app.ProfileUIAxes, 'Title')
            xlabel(app.ProfileUIAxes, 'X')
            ylabel(app.ProfileUIAxes, 'Y')
            app.ProfileUIAxes.Position = [10 230 660 440];

            % Create ProfileXAxisScaleButtonGroup
            app.ProfileXAxisScaleButtonGroup = uibuttongroup(app.ProfileTab);
            app.ProfileXAxisScaleButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ProfileXAxisScaleButtonGroupSelectionChanged, true);
            app.ProfileXAxisScaleButtonGroup.Title = 'X Axis Scale';
            app.ProfileXAxisScaleButtonGroup.Position = [680 600 140 50];

            % Create ProfileXAxisLogButton
            app.ProfileXAxisLogButton = uiradiobutton(app.ProfileXAxisScaleButtonGroup);
            app.ProfileXAxisLogButton.Text = 'Log';
            app.ProfileXAxisLogButton.Position = [11 5 58 22];
            app.ProfileXAxisLogButton.Value = true;

            % Create ProfileXAxisLinearButton
            app.ProfileXAxisLinearButton = uiradiobutton(app.ProfileXAxisScaleButtonGroup);
            app.ProfileXAxisLinearButton.Text = 'Linear';
            app.ProfileXAxisLinearButton.Position = [77 5 65 22];

            % Create ProfileYAxisScaleButtonGroup
            app.ProfileYAxisScaleButtonGroup = uibuttongroup(app.ProfileTab);
            app.ProfileYAxisScaleButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ProfileXAxisScaleButtonGroupSelectionChanged, true);
            app.ProfileYAxisScaleButtonGroup.Title = 'Y Axis Scale';
            app.ProfileYAxisScaleButtonGroup.Position = [680 540 140 50];

            % Create ProfileYAxisLogButton
            app.ProfileYAxisLogButton = uiradiobutton(app.ProfileYAxisScaleButtonGroup);
            app.ProfileYAxisLogButton.Text = 'Log';
            app.ProfileYAxisLogButton.Position = [11 5 58 22];
            app.ProfileYAxisLogButton.Value = true;

            % Create ProfileYAxisLinearButton
            app.ProfileYAxisLinearButton = uiradiobutton(app.ProfileYAxisScaleButtonGroup);
            app.ProfileYAxisLinearButton.Text = 'Linear';
            app.ProfileYAxisLinearButton.Position = [77 5 65 22];

            % Create XAxisResolutionButtonGroup
            app.XAxisResolutionButtonGroup = uibuttongroup(app.ProfileTab);
            app.XAxisResolutionButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @XAxisResolutionButtonGroupSelectionChanged, true);
            app.XAxisResolutionButtonGroup.Title = 'X Axis Resolution';
            app.XAxisResolutionButtonGroup.Position = [680 455 140 75];

            % Create XAxisOnePixelResButton
            app.XAxisOnePixelResButton = uiradiobutton(app.XAxisResolutionButtonGroup);
            app.XAxisOnePixelResButton.Text = '1 Pixel Resolution';
            app.XAxisOnePixelResButton.Position = [10 30 118 22];
            app.XAxisOnePixelResButton.Value = true;

            % Create XAxisPointsResButton
            app.XAxisPointsResButton = uiradiobutton(app.XAxisResolutionButtonGroup);
            app.XAxisPointsResButton.Text = '                      Points';
            app.XAxisPointsResButton.Position = [10 8 129 22];

            % Create XAxisPoints
            app.XAxisPoints = uieditfield(app.XAxisResolutionButtonGroup, 'numeric');
            app.XAxisPoints.Limits = [2 Inf];
            app.XAxisPoints.ValueDisplayFormat = '%d';
            app.XAxisPoints.ValueChangedFcn = createCallbackFcn(app, @XAxisPointsValueChanged, true);
            app.XAxisPoints.HorizontalAlignment = 'center';
            app.XAxisPoints.Position = [28 8 69 22];
            app.XAxisPoints.Value = 500;

            % Create XAxisUnitButtonGroup
            app.XAxisUnitButtonGroup = uibuttongroup(app.ProfileTab);
            app.XAxisUnitButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @XAxisUnitButtonGroupSelectionChanged, true);
            app.XAxisUnitButtonGroup.Title = 'X Axis Unit';
            app.XAxisUnitButtonGroup.Position = [680 390 140 55];

            % Create qXAxisUnitButton
            app.qXAxisUnitButton = uiradiobutton(app.XAxisUnitButtonGroup);
            app.qXAxisUnitButton.Text = 'q (1/A)';
            app.qXAxisUnitButton.Position = [11 8 58 22];
            app.qXAxisUnitButton.Value = true;

            % Create tthXAxisUnitButton
            app.tthXAxisUnitButton = uiradiobutton(app.XAxisUnitButtonGroup);
            app.tthXAxisUnitButton.Text = 'tth (deg.)';
            app.tthXAxisUnitButton.Position = [69 8 70 22];

            % Create ExportcurrentprofileButton
            app.ExportcurrentprofileButton = uibutton(app.ProfileTab, 'push');
            app.ExportcurrentprofileButton.ButtonPushedFcn = createCallbackFcn(app, @CurrentProfileMenuSelected, true);
            app.ExportcurrentprofileButton.Position = [680 357 140 22];
            app.ExportcurrentprofileButton.Text = 'Export current profile';

            % Create MaskConfigTab
            app.MaskConfigTab = uitab(app.MainTabGroup);
            app.MaskConfigTab.Title = 'Mask Config';

            % Create EffectiveMaskPreviewUIAxes
            app.EffectiveMaskPreviewUIAxes = uiaxes(app.MaskConfigTab);
            title(app.EffectiveMaskPreviewUIAxes, 'Title')
            xlabel(app.EffectiveMaskPreviewUIAxes, 'X')
            ylabel(app.EffectiveMaskPreviewUIAxes, 'Y')
            app.EffectiveMaskPreviewUIAxes.Position = [10 140 530 530];

            % Create CSVMaskUITable
            app.CSVMaskUITable = uitable(app.MaskConfigTab);
            app.CSVMaskUITable.ColumnName = {'CSV File Name'; 'Active'; 'Inverse'};
            app.CSVMaskUITable.ColumnWidth = {'auto', 58, 58};
            app.CSVMaskUITable.RowName = {''};
            app.CSVMaskUITable.ColumnEditable = [true true true];
            app.CSVMaskUITable.CellEditCallback = createCallbackFcn(app, @CSVMaskUITableCellEdit, true);
            app.CSVMaskUITable.Position = [550 425 270 245];

            % Create SaveCurrentMaskPreviewtoEffectiveMaskPoolButton
            app.SaveCurrentMaskPreviewtoEffectiveMaskPoolButton = uibutton(app.MaskConfigTab, 'push');
            app.SaveCurrentMaskPreviewtoEffectiveMaskPoolButton.ButtonPushedFcn = createCallbackFcn(app, @SaveCurrentMaskPreviewtoEffectiveMaskPoolButtonPushed, true);
            app.SaveCurrentMaskPreviewtoEffectiveMaskPoolButton.Position = [596 140 178 36];
            app.SaveCurrentMaskPreviewtoEffectiveMaskPoolButton.Text = {'Save Current Mask Preview to'; 'Effective Mask Pool'};

            % Create EffectiveMaskNameEditFieldLabel
            app.EffectiveMaskNameEditFieldLabel = uilabel(app.MaskConfigTab);
            app.EffectiveMaskNameEditFieldLabel.HorizontalAlignment = 'right';
            app.EffectiveMaskNameEditFieldLabel.Position = [564 204 119 22];
            app.EffectiveMaskNameEditFieldLabel.Text = 'Effective Mask Name';

            % Create EffectiveMaskNameEditField
            app.EffectiveMaskNameEditField = uieditfield(app.MaskConfigTab, 'text');
            app.EffectiveMaskNameEditField.Position = [564 183 242 22];

            % Create EffectiveMaskListUITable
            app.EffectiveMaskListUITable = uitable(app.MaskConfigTab);
            app.EffectiveMaskListUITable.ColumnName = {'Effective Mask Name'};
            app.EffectiveMaskListUITable.RowName = {};
            app.EffectiveMaskListUITable.ColumnEditable = true;
            app.EffectiveMaskListUITable.CellEditCallback = createCallbackFcn(app, @SaveCurrentMaskPreviewtoEffectiveMaskPoolButtonPushed, true);
            app.EffectiveMaskListUITable.Position = [550 233 270 177];

            % Create RegionofInterestTab
            app.RegionofInterestTab = uitab(app.MainTabGroup);
            app.RegionofInterestTab.Title = 'Region of Interest';

            % Create MaskPreviewUIAxes
            app.MaskPreviewUIAxes = uiaxes(app.RegionofInterestTab);
            title(app.MaskPreviewUIAxes, 'Title')
            xlabel(app.MaskPreviewUIAxes, 'X')
            ylabel(app.MaskPreviewUIAxes, 'Y')
            app.MaskPreviewUIAxes.Position = [10 140 530 530];

            % Create MaskGenTabGroup
            app.MaskGenTabGroup = uitabgroup(app.RegionofInterestTab);
            app.MaskGenTabGroup.Position = [550 510 270 140];

            % Create RadiusMaskGenTab
            app.RadiusMaskGenTab = uitab(app.MaskGenTabGroup);
            app.RadiusMaskGenTab.Title = 'Radius';

            % Create RadiusMaskGenUITable
            app.RadiusMaskGenUITable = uitable(app.RadiusMaskGenTab);
            app.RadiusMaskGenUITable.ColumnName = {'Parameter'; 'Value'};
            app.RadiusMaskGenUITable.RowName = {};
            app.RadiusMaskGenUITable.ColumnEditable = [false true];
            app.RadiusMaskGenUITable.CellEditCallback = createCallbackFcn(app, @RadiusMaskGenUITableCellEdit, true);
            app.RadiusMaskGenUITable.Position = [0 0 270 116];

            % Create RectangleMaskGenTab
            app.RectangleMaskGenTab = uitab(app.MaskGenTabGroup);
            app.RectangleMaskGenTab.Title = 'Rectangle';

            % Create RectangleMaskGenUITable
            app.RectangleMaskGenUITable = uitable(app.RectangleMaskGenTab);
            app.RectangleMaskGenUITable.ColumnName = {'Parameter'; 'Value'};
            app.RectangleMaskGenUITable.RowName = {};
            app.RectangleMaskGenUITable.ColumnEditable = [false true];
            app.RectangleMaskGenUITable.CellEditCallback = createCallbackFcn(app, @RadiusMaskGenUITableCellEdit, true);
            app.RectangleMaskGenUITable.Position = [0 0 270 116];

            % Create SaveROIButton
            app.SaveROIButton = uibutton(app.RegionofInterestTab, 'push');
            app.SaveROIButton.ButtonPushedFcn = createCallbackFcn(app, @SaveROIButtonPushed, true);
            app.SaveROIButton.Position = [719 140 100 22];
            app.SaveROIButton.Text = 'Save ROI';

            % Create MaskGenSymmetryButtonGroup
            app.MaskGenSymmetryButtonGroup = uibuttongroup(app.RegionofInterestTab);
            app.MaskGenSymmetryButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @MaskGenSymmetryButtonGroupSelectionChanged, true);
            app.MaskGenSymmetryButtonGroup.Title = 'Symmetry';
            app.MaskGenSymmetryButtonGroup.Position = [550 420 270 80];

            % Create MaskGenNoneSymButton
            app.MaskGenNoneSymButton = uiradiobutton(app.MaskGenSymmetryButtonGroup);
            app.MaskGenNoneSymButton.Text = 'None';
            app.MaskGenNoneSymButton.Position = [11 32 58 22];
            app.MaskGenNoneSymButton.Value = true;

            % Create MaskGenCenSymButton
            app.MaskGenCenSymButton = uiradiobutton(app.MaskGenSymmetryButtonGroup);
            app.MaskGenCenSymButton.Text = 'Central Symmetry';
            app.MaskGenCenSymButton.Position = [130 32 118 22];

            % Create MaskGenXMirrorButton
            app.MaskGenXMirrorButton = uiradiobutton(app.MaskGenSymmetryButtonGroup);
            app.MaskGenXMirrorButton.Text = 'X axis Mirror';
            app.MaskGenXMirrorButton.Position = [11 6 89 22];

            % Create MaskGenYMirrorButton
            app.MaskGenYMirrorButton = uiradiobutton(app.MaskGenSymmetryButtonGroup);
            app.MaskGenYMirrorButton.Text = 'Y axis Mirror';
            app.MaskGenYMirrorButton.Position = [130 6 89 22];

            % Create MaskGenRefreshButton
            app.MaskGenRefreshButton = uibutton(app.RegionofInterestTab, 'push');
            app.MaskGenRefreshButton.ButtonPushedFcn = createCallbackFcn(app, @MaskGenRefreshButtonPushed, true);
            app.MaskGenRefreshButton.Position = [615 141 100 22];
            app.MaskGenRefreshButton.Text = 'Refresh';

            % Create ROIListUITable
            app.ROIListUITable = uitable(app.RegionofInterestTab);
            app.ROIListUITable.ColumnName = {'ROI Name'};
            app.ROIListUITable.RowName = {};
            app.ROIListUITable.ColumnEditable = true;
            app.ROIListUITable.Position = [550 230 270 177];

            % Create ROINameEditFieldLabel
            app.ROINameEditFieldLabel = uilabel(app.RegionofInterestTab);
            app.ROINameEditFieldLabel.HorizontalAlignment = 'right';
            app.ROINameEditFieldLabel.Position = [554 200 62 22];
            app.ROINameEditFieldLabel.Text = 'ROI Name';

            % Create ROINameEditField
            app.ROINameEditField = uieditfield(app.RegionofInterestTab, 'text');
            app.ROINameEditField.Position = [551 179 268 22];

            % Create ExperimentalConditionsTab
            app.ExperimentalConditionsTab = uitab(app.MainTabGroup);
            app.ExperimentalConditionsTab.Title = 'Experimental Conditions';

            % Create ParametersinProcessButtonGroup
            app.ParametersinProcessButtonGroup = uibuttongroup(app.ExperimentalConditionsTab);
            app.ParametersinProcessButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ParametersinProcessButtonGroupSelectionChanged, true);
            app.ParametersinProcessButtonGroup.Title = 'Parameters in Process';
            app.ParametersinProcessButtonGroup.Position = [10 620 180 55];

            % Create DefaultButton
            app.DefaultButton = uiradiobutton(app.ParametersinProcessButtonGroup);
            app.DefaultButton.Text = 'Default';
            app.DefaultButton.Position = [11 8 60 22];
            app.DefaultButton.Value = true;

            % Create UserDefineButton
            app.UserDefineButton = uiradiobutton(app.ParametersinProcessButtonGroup);
            app.UserDefineButton.Text = 'User Define';
            app.UserDefineButton.Position = [91 8 85 22];

            % Create ExpCondUITable
            app.ExpCondUITable = uitable(app.ExperimentalConditionsTab);
            app.ExpCondUITable.ColumnName = {'Parameter'; 'Current Setting'; 'Default'; 'User Define'};
            app.ExpCondUITable.RowName = {};
            app.ExpCondUITable.ColumnEditable = [false false false true];
            app.ExpCondUITable.CellEditCallback = createCallbackFcn(app, @ExpCondUITableCellEdit, true);
            app.ExpCondUITable.Position = [10 140 810 470];

            % Create MultiProfileTab
            app.MultiProfileTab = uitab(app.MainTabGroup);
            app.MultiProfileTab.Title = 'Multi-Profile';

            % Create MultiProfileUIAxes
            app.MultiProfileUIAxes = uiaxes(app.MultiProfileTab);
            title(app.MultiProfileUIAxes, 'Title')
            xlabel(app.MultiProfileUIAxes, 'X')
            ylabel(app.MultiProfileUIAxes, 'Y')
            app.MultiProfileUIAxes.Position = [10 230 660 440];

            % Create MultiProfileXAxisScaleButtonGroup
            app.MultiProfileXAxisScaleButtonGroup = uibuttongroup(app.MultiProfileTab);
            app.MultiProfileXAxisScaleButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ProfileXAxisScaleButtonGroupSelectionChanged, true);
            app.MultiProfileXAxisScaleButtonGroup.Title = 'X Axis Scale';
            app.MultiProfileXAxisScaleButtonGroup.Position = [680 600 140 50];

            % Create MultiProfileXAxisLogButton
            app.MultiProfileXAxisLogButton = uiradiobutton(app.MultiProfileXAxisScaleButtonGroup);
            app.MultiProfileXAxisLogButton.Text = 'Log';
            app.MultiProfileXAxisLogButton.Position = [11 5 58 22];
            app.MultiProfileXAxisLogButton.Value = true;

            % Create MultiProfileXAxisLinearButton
            app.MultiProfileXAxisLinearButton = uiradiobutton(app.MultiProfileXAxisScaleButtonGroup);
            app.MultiProfileXAxisLinearButton.Text = 'Linear';
            app.MultiProfileXAxisLinearButton.Position = [77 5 65 22];

            % Create MultiProfileYAxisScaleButtonGroup
            app.MultiProfileYAxisScaleButtonGroup = uibuttongroup(app.MultiProfileTab);
            app.MultiProfileYAxisScaleButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ProfileXAxisScaleButtonGroupSelectionChanged, true);
            app.MultiProfileYAxisScaleButtonGroup.Title = 'Y Axis Scale';
            app.MultiProfileYAxisScaleButtonGroup.Position = [680 540 140 50];

            % Create MultiProfileYAxisLogButton
            app.MultiProfileYAxisLogButton = uiradiobutton(app.MultiProfileYAxisScaleButtonGroup);
            app.MultiProfileYAxisLogButton.Text = 'Log';
            app.MultiProfileYAxisLogButton.Position = [11 5 58 22];
            app.MultiProfileYAxisLogButton.Value = true;

            % Create MultiProfileYAxisLinearButton
            app.MultiProfileYAxisLinearButton = uiradiobutton(app.MultiProfileYAxisScaleButtonGroup);
            app.MultiProfileYAxisLinearButton.Text = 'Linear';
            app.MultiProfileYAxisLinearButton.Position = [77 5 65 22];

            % Create PoleFigureTab
            app.PoleFigureTab = uitab(app.MainTabGroup);
            app.PoleFigureTab.Title = 'Pole Figure';

            % Create PoleFigureUIAxes
            app.PoleFigureUIAxes = uiaxes(app.PoleFigureTab);
            title(app.PoleFigureUIAxes, 'Title')
            xlabel(app.PoleFigureUIAxes, 'X')
            ylabel(app.PoleFigureUIAxes, 'Y')
            app.PoleFigureUIAxes.DataAspectRatio = [1 1 1];
            app.PoleFigureUIAxes.Position = [10 140 530 530];

            % Create PoleFigureGeometeryButtonGroup
            app.PoleFigureGeometeryButtonGroup = uibuttongroup(app.PoleFigureTab);
            app.PoleFigureGeometeryButtonGroup.Title = 'Pole Figure Geometery';
            app.PoleFigureGeometeryButtonGroup.Position = [558 596 251 74];

            % Create IncidentAngleButton
            app.IncidentAngleButton = uiradiobutton(app.PoleFigureGeometeryButtonGroup);
            app.IncidentAngleButton.Text = 'Incident Angle';
            app.IncidentAngleButton.Position = [4 29 98 22];
            app.IncidentAngleButton.Value = true;

            % Create ReflectionPointButton
            app.ReflectionPointButton = uiradiobutton(app.PoleFigureGeometeryButtonGroup);
            app.ReflectionPointButton.Text = 'Reflection Point';
            app.ReflectionPointButton.Position = [114 28 106 22];

            % Create IncidentAngleEditField
            app.IncidentAngleEditField = uieditfield(app.PoleFigureGeometeryButtonGroup, 'numeric');
            app.IncidentAngleEditField.ValueDisplayFormat = '%2.2g deg.';
            app.IncidentAngleEditField.Position = [10 7 92 22];

            % Create ReflectionXEditField
            app.ReflectionXEditField = uieditfield(app.PoleFigureGeometeryButtonGroup, 'numeric');
            app.ReflectionXEditField.ValueDisplayFormat = '%4.2g X';
            app.ReflectionXEditField.Position = [121 8 58 22];

            % Create ReflectionYEditField
            app.ReflectionYEditField = uieditfield(app.PoleFigureGeometeryButtonGroup, 'numeric');
            app.ReflectionYEditField.ValueDisplayFormat = '%4.2g Y';
            app.ReflectionYEditField.Position = [185 7 58 22];

            % Create PlotingConfigurationPanel
            app.PlotingConfigurationPanel = uipanel(app.PoleFigureTab);
            app.PlotingConfigurationPanel.Title = 'Ploting Configuration';
            app.PlotingConfigurationPanel.Position = [558 366 251 221];

            % Create qzminEditFieldLabel
            app.qzminEditFieldLabel = uilabel(app.PlotingConfigurationPanel);
            app.qzminEditFieldLabel.HorizontalAlignment = 'right';
            app.qzminEditFieldLabel.Position = [10 169 44 22];
            app.qzminEditFieldLabel.Text = 'qz min.';

            % Create qzminEditField
            app.qzminEditField = uieditfield(app.PlotingConfigurationPanel, 'numeric');
            app.qzminEditField.Position = [69 169 174 22];

            % Create qzmaxEditFieldLabel
            app.qzmaxEditFieldLabel = uilabel(app.PlotingConfigurationPanel);
            app.qzmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.qzmaxEditFieldLabel.Position = [8 142 48 22];
            app.qzmaxEditFieldLabel.Text = 'qz max.';

            % Create qzmaxEditField
            app.qzmaxEditField = uieditfield(app.PlotingConfigurationPanel, 'numeric');
            app.qzmaxEditField.Position = [69 142 174 22];

            % Create qrminEditFieldLabel
            app.qrminEditFieldLabel = uilabel(app.PlotingConfigurationPanel);
            app.qrminEditFieldLabel.HorizontalAlignment = 'right';
            app.qrminEditFieldLabel.Position = [12 113 42 22];
            app.qrminEditFieldLabel.Text = 'qr min.';

            % Create qrminEditField
            app.qrminEditField = uieditfield(app.PlotingConfigurationPanel, 'numeric');
            app.qrminEditField.Position = [69 113 174 22];

            % Create qrmaxEditFieldLabel
            app.qrmaxEditFieldLabel = uilabel(app.PlotingConfigurationPanel);
            app.qrmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.qrmaxEditFieldLabel.Position = [10 86 46 22];
            app.qrmaxEditFieldLabel.Text = 'qr max.';

            % Create qrmaxEditField
            app.qrmaxEditField = uieditfield(app.PlotingConfigurationPanel, 'numeric');
            app.qrmaxEditField.Position = [69 86 174 22];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.SAXSReductionUIFigure);
            app.TabGroup2.Position = [850 141 300 579];

            % Create DataStorageTab
            app.DataStorageTab = uitab(app.TabGroup2);
            app.DataStorageTab.Title = 'Data Storage';

            % Create TabGroup5
            app.TabGroup5 = uitabgroup(app.DataStorageTab);
            app.TabGroup5.Position = [0 0 300 85];

            % Create SelectionControlTab
            app.SelectionControlTab = uitab(app.TabGroup5);
            app.SelectionControlTab.Title = 'Selection Control';

            % Create ExportSelectedStoredDataButton
            app.ExportSelectedStoredDataButton = uibutton(app.SelectionControlTab, 'push');
            app.ExportSelectedStoredDataButton.ButtonPushedFcn = createCallbackFcn(app, @ExportSelectedStoredDataButtonPushed, true);
            app.ExportSelectedStoredDataButton.Position = [15 31 115 22];
            app.ExportSelectedStoredDataButton.Text = 'Export Selected';

            % Create PlotSelectedStoredDataButton
            app.PlotSelectedStoredDataButton = uibutton(app.SelectionControlTab, 'push');
            app.PlotSelectedStoredDataButton.ButtonPushedFcn = createCallbackFcn(app, @ExportSelectedStoredDataButtonPushed, true);
            app.PlotSelectedStoredDataButton.Position = [160 31 115 22];
            app.PlotSelectedStoredDataButton.Text = 'Plot Selected';

            % Create DeleteSelectedStoredDataButton
            app.DeleteSelectedStoredDataButton = uibutton(app.SelectionControlTab, 'push');
            app.DeleteSelectedStoredDataButton.ButtonPushedFcn = createCallbackFcn(app, @ExportSelectedStoredDataButtonPushed, true);
            app.DeleteSelectedStoredDataButton.Position = [15 5 115 22];
            app.DeleteSelectedStoredDataButton.Text = 'Delete Selected';

            % Create SelectUnselectAllButton
            app.SelectUnselectAllButton = uibutton(app.SelectionControlTab, 'push');
            app.SelectUnselectAllButton.ButtonPushedFcn = createCallbackFcn(app, @ExportSelectedStoredDataButtonPushed, true);
            app.SelectUnselectAllButton.Position = [159.5 5 116 22];
            app.SelectUnselectAllButton.Text = 'Select/Unselect All';

            % Create StoredDataOffsetMagnificationTab
            app.StoredDataOffsetMagnificationTab = uitab(app.TabGroup5);
            app.StoredDataOffsetMagnificationTab.Title = 'Offset/Magnification';

            % Create OffsetEditFieldLabel
            app.OffsetEditFieldLabel = uilabel(app.StoredDataOffsetMagnificationTab);
            app.OffsetEditFieldLabel.HorizontalAlignment = 'right';
            app.OffsetEditFieldLabel.Position = [6 4 37 22];
            app.OffsetEditFieldLabel.Text = 'Offset';

            % Create StoredDataOffsetEditField
            app.StoredDataOffsetEditField = uieditfield(app.StoredDataOffsetMagnificationTab, 'numeric');
            app.StoredDataOffsetEditField.ValueChangedFcn = createCallbackFcn(app, @TargetStoredDataDropDownValueChanged, true);
            app.StoredDataOffsetEditField.Position = [48 4 78 22];

            % Create MagnificationEditFieldLabel
            app.MagnificationEditFieldLabel = uilabel(app.StoredDataOffsetMagnificationTab);
            app.MagnificationEditFieldLabel.HorizontalAlignment = 'right';
            app.MagnificationEditFieldLabel.Position = [129 4 76 22];
            app.MagnificationEditFieldLabel.Text = 'Magnification';

            % Create StoredDataMagnificationEditField
            app.StoredDataMagnificationEditField = uieditfield(app.StoredDataOffsetMagnificationTab, 'numeric');
            app.StoredDataMagnificationEditField.ValueChangedFcn = createCallbackFcn(app, @TargetStoredDataDropDownValueChanged, true);
            app.StoredDataMagnificationEditField.Position = [212 4 78 22];
            app.StoredDataMagnificationEditField.Value = 1;

            % Create TargetProfileLabel
            app.TargetProfileLabel = uilabel(app.StoredDataOffsetMagnificationTab);
            app.TargetProfileLabel.HorizontalAlignment = 'right';
            app.TargetProfileLabel.Position = [5 31 76 22];
            app.TargetProfileLabel.Text = 'Target Profile';

            % Create TargetStoredDataDropDown
            app.TargetStoredDataDropDown = uidropdown(app.StoredDataOffsetMagnificationTab);
            app.TargetStoredDataDropDown.Items = {'None'};
            app.TargetStoredDataDropDown.ItemsData = {'0'};
            app.TargetStoredDataDropDown.ValueChangedFcn = createCallbackFcn(app, @TargetStoredDataDropDownValueChanged, true);
            app.TargetStoredDataDropDown.Position = [87 31 203 22];
            app.TargetStoredDataDropDown.Value = '0';

            % Create DataStorageUITable
            app.DataStorageUITable = uitable(app.DataStorageTab);
            app.DataStorageUITable.ColumnName = {'Select'; 'Name'};
            app.DataStorageUITable.ColumnWidth = {50, 'auto'};
            app.DataStorageUITable.ColumnEditable = [true true];
            app.DataStorageUITable.CellEditCallback = createCallbackFcn(app, @DataStorageUITableCellEdit, true);
            app.DataStorageUITable.Position = [0 120 300 435];

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.SAXSReductionUIFigure);
            app.TabGroup4.Position = [850 10 300 120];

            % Create MessageTab
            app.MessageTab = uitab(app.TabGroup4);
            app.MessageTab.Title = 'Message';

            % Create MessageTextArea
            app.MessageTextArea = uitextarea(app.MessageTab);
            app.MessageTextArea.Editable = 'off';
            app.MessageTextArea.Position = [0 0 300 95];

            % Create UserControlTabGroup
            app.UserControlTabGroup = uitabgroup(app.SAXSReductionUIFigure);
            app.UserControlTabGroup.Position = [20 20 810 120];

            % Create DataSheetSelectionTab
            app.DataSheetSelectionTab = uitab(app.UserControlTabGroup);
            app.DataSheetSelectionTab.Title = 'Data-Sheet Selection';

            % Create CurrentDataSheetSpinner
            app.CurrentDataSheetSpinner = uispinner(app.DataSheetSelectionTab);
            app.CurrentDataSheetSpinner.ValueChangedFcn = createCallbackFcn(app, @CurrentDataSheetSpinnerValueChanged, true);
            app.CurrentDataSheetSpinner.Position = [6 63 129 22];

            % Create CurrentDataSheetReDrawButton
            app.CurrentDataSheetReDrawButton = uibutton(app.DataSheetSelectionTab, 'push');
            app.CurrentDataSheetReDrawButton.ButtonPushedFcn = createCallbackFcn(app, @CurrentDataSheetSpinnerValueChanged, true);
            app.CurrentDataSheetReDrawButton.Position = [6 36 129 22];
            app.CurrentDataSheetReDrawButton.Text = 'Redraw Current Data';

            % Create BackgroundConfigurationPanel
            app.BackgroundConfigurationPanel = uipanel(app.DataSheetSelectionTab);
            app.BackgroundConfigurationPanel.Title = 'Background Configuration';
            app.BackgroundConfigurationPanel.Position = [384 0 425 95];

            % Create BackgroundIDDropDownLabel
            app.BackgroundIDDropDownLabel = uilabel(app.BackgroundConfigurationPanel);
            app.BackgroundIDDropDownLabel.HorizontalAlignment = 'right';
            app.BackgroundIDDropDownLabel.Position = [1 50 94 22];
            app.BackgroundIDDropDownLabel.Text = 'Background ID';

            % Create BackgroundIDDropDown
            app.BackgroundIDDropDown = uidropdown(app.BackgroundConfigurationPanel);
            app.BackgroundIDDropDown.Items = {'None'};
            app.BackgroundIDDropDown.ItemsData = {'0'};
            app.BackgroundIDDropDown.ValueChangedFcn = createCallbackFcn(app, @SaveCurrentDataAsBackgroundButtonPushed, true);
            app.BackgroundIDDropDown.Position = [127 50 288 22];
            app.BackgroundIDDropDown.Value = '0';

            % Create BGDrawButton
            app.BGDrawButton = uibutton(app.BackgroundConfigurationPanel, 'push');
            app.BGDrawButton.ButtonPushedFcn = createCallbackFcn(app, @SaveCurrentDataAsBackgroundButtonPushed, true);
            app.BGDrawButton.Position = [215 26 64 22];
            app.BGDrawButton.Text = 'Draw';

            % Create SaveCurrentDataAsBackgroundButton
            app.SaveCurrentDataAsBackgroundButton = uibutton(app.BackgroundConfigurationPanel, 'push');
            app.SaveCurrentDataAsBackgroundButton.ButtonPushedFcn = createCallbackFcn(app, @SaveCurrentDataAsBackgroundButtonPushed, true);
            app.SaveCurrentDataAsBackgroundButton.Position = [215 4 200 20];
            app.SaveCurrentDataAsBackgroundButton.Text = 'Save Current Data As Background';

            % Create SampleTransEditFieldLabel
            app.SampleTransEditFieldLabel = uilabel(app.BackgroundConfigurationPanel);
            app.SampleTransEditFieldLabel.HorizontalAlignment = 'right';
            app.SampleTransEditFieldLabel.Position = [8 26 83 22];
            app.SampleTransEditFieldLabel.Text = 'Sample Trans.';

            % Create SampleTransEditField
            app.SampleTransEditField = uieditfield(app.BackgroundConfigurationPanel, 'numeric');
            app.SampleTransEditField.ValueChangedFcn = createCallbackFcn(app, @SaveCurrentDataAsBackgroundButtonPushed, true);
            app.SampleTransEditField.Position = [106 26 100 20];
            app.SampleTransEditField.Value = 1;

            % Create BufferTransEditFieldLabel
            app.BufferTransEditFieldLabel = uilabel(app.BackgroundConfigurationPanel);
            app.BufferTransEditFieldLabel.HorizontalAlignment = 'right';
            app.BufferTransEditFieldLabel.Position = [17 3 74 22];
            app.BufferTransEditFieldLabel.Text = 'Buffer Trans.';

            % Create BufferTransEditField
            app.BufferTransEditField = uieditfield(app.BackgroundConfigurationPanel, 'numeric');
            app.BufferTransEditField.ValueChangedFcn = createCallbackFcn(app, @SaveCurrentDataAsBackgroundButtonPushed, true);
            app.BufferTransEditField.Position = [106 3 100 20];
            app.BufferTransEditField.Value = 1;

            % Create BGRemoveButton
            app.BGRemoveButton = uibutton(app.BackgroundConfigurationPanel, 'push');
            app.BGRemoveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveCurrentDataAsBackgroundButtonPushed, true);
            app.BGRemoveButton.Position = [286 25 58 22];
            app.BGRemoveButton.Text = 'Remove';

            % Create EffectiveMaskSelectionPanel
            app.EffectiveMaskSelectionPanel = uipanel(app.DataSheetSelectionTab);
            app.EffectiveMaskSelectionPanel.Title = 'Effective Mask Selection';
            app.EffectiveMaskSelectionPanel.Position = [145 49 240 46];

            % Create EffectiveMaskSelectionDropDown
            app.EffectiveMaskSelectionDropDown = uidropdown(app.EffectiveMaskSelectionPanel);
            app.EffectiveMaskSelectionDropDown.Items = {'None'};
            app.EffectiveMaskSelectionDropDown.ItemsData = {'0'};
            app.EffectiveMaskSelectionDropDown.ValueChangedFcn = createCallbackFcn(app, @EffectiveMaskSelectionDropDownValueChanged, true);
            app.EffectiveMaskSelectionDropDown.Position = [9 3 221 22];
            app.EffectiveMaskSelectionDropDown.Value = '0';

            % Create SaturationEliminationCheckBox
            app.SaturationEliminationCheckBox = uicheckbox(app.DataSheetSelectionTab);
            app.SaturationEliminationCheckBox.Text = 'Saturation-Elimination';
            app.SaturationEliminationCheckBox.Position = [6 7 139 22];

            % Create ROISelectionPanel
            app.ROISelectionPanel = uipanel(app.DataSheetSelectionTab);
            app.ROISelectionPanel.Title = 'ROI Selection';
            app.ROISelectionPanel.Position = [145 2 240 45];

            % Create ROISelectionDropDown
            app.ROISelectionDropDown = uidropdown(app.ROISelectionPanel);
            app.ROISelectionDropDown.Items = {'None'};
            app.ROISelectionDropDown.ItemsData = {'0'};
            app.ROISelectionDropDown.Position = [9 2 221 22];
            app.ROISelectionDropDown.Value = '0';

            % Create MultiDataSheetProcessingTab
            app.MultiDataSheetProcessingTab = uitab(app.UserControlTabGroup);
            app.MultiDataSheetProcessingTab.Title = 'Multi-Data-Sheet Processing';

            % Create StartEditFieldLabel
            app.StartEditFieldLabel = uilabel(app.MultiDataSheetProcessingTab);
            app.StartEditFieldLabel.HorizontalAlignment = 'right';
            app.StartEditFieldLabel.Position = [34 62 31 22];
            app.StartEditFieldLabel.Text = 'Start';

            % Create MultiDataStartSNEditField
            app.MultiDataStartSNEditField = uieditfield(app.MultiDataSheetProcessingTab, 'numeric');
            app.MultiDataStartSNEditField.RoundFractionalValues = 'on';
            app.MultiDataStartSNEditField.ValueDisplayFormat = '%.0f';
            app.MultiDataStartSNEditField.HorizontalAlignment = 'center';
            app.MultiDataStartSNEditField.Position = [80 62 100 22];
            app.MultiDataStartSNEditField.Value = 1;

            % Create IncrementEditFieldLabel
            app.IncrementEditFieldLabel = uilabel(app.MultiDataSheetProcessingTab);
            app.IncrementEditFieldLabel.HorizontalAlignment = 'right';
            app.IncrementEditFieldLabel.Position = [208 61 59 22];
            app.IncrementEditFieldLabel.Text = 'Increment';

            % Create MultiDataIncrementEditField
            app.MultiDataIncrementEditField = uieditfield(app.MultiDataSheetProcessingTab, 'numeric');
            app.MultiDataIncrementEditField.Limits = [1 Inf];
            app.MultiDataIncrementEditField.RoundFractionalValues = 'on';
            app.MultiDataIncrementEditField.ValueDisplayFormat = '%.0f';
            app.MultiDataIncrementEditField.HorizontalAlignment = 'center';
            app.MultiDataIncrementEditField.Position = [282 61 100 22];
            app.MultiDataIncrementEditField.Value = 1;

            % Create EndEditFieldLabel
            app.EndEditFieldLabel = uilabel(app.MultiDataSheetProcessingTab);
            app.EndEditFieldLabel.HorizontalAlignment = 'right';
            app.EndEditFieldLabel.Position = [406 61 27 22];
            app.EndEditFieldLabel.Text = 'End';

            % Create MultiDataEndSNEditField
            app.MultiDataEndSNEditField = uieditfield(app.MultiDataSheetProcessingTab, 'numeric');
            app.MultiDataEndSNEditField.RoundFractionalValues = 'on';
            app.MultiDataEndSNEditField.ValueDisplayFormat = '%.0f';
            app.MultiDataEndSNEditField.HorizontalAlignment = 'center';
            app.MultiDataEndSNEditField.Position = [448 61 100 22];
            app.MultiDataEndSNEditField.Value = 1;

            % Create AvgMultiDataSheetButton
            app.AvgMultiDataSheetButton = uibutton(app.MultiDataSheetProcessingTab, 'push');
            app.AvgMultiDataSheetButton.ButtonPushedFcn = createCallbackFcn(app, @AvgMultiDataSheetButtonPushed, true);
            app.AvgMultiDataSheetButton.Position = [566 60 118 22];
            app.AvgMultiDataSheetButton.Text = 'Average Muiti-Data';

            % Create SkipDataSheetEditFieldLabel
            app.SkipDataSheetEditFieldLabel = uilabel(app.MultiDataSheetProcessingTab);
            app.SkipDataSheetEditFieldLabel.HorizontalAlignment = 'right';
            app.SkipDataSheetEditFieldLabel.Position = [22 16 92 22];
            app.SkipDataSheetEditFieldLabel.Text = 'Skip Data Sheet';

            % Create MultiDataSkipSNEditField
            app.MultiDataSkipSNEditField = uieditfield(app.MultiDataSheetProcessingTab, 'text');
            app.MultiDataSkipSNEditField.Position = [129 16 419 22];

            % Create PlotMultiDataSheetButton
            app.PlotMultiDataSheetButton = uibutton(app.MultiDataSheetProcessingTab, 'push');
            app.PlotMultiDataSheetButton.ButtonPushedFcn = createCallbackFcn(app, @PlotMultiDataSheetButtonPushed, true);
            app.PlotMultiDataSheetButton.Position = [691 60 100 22];
            app.PlotMultiDataSheetButton.Text = 'Plot Multi-Data';

            % Create ExportAvgMultiDataSheetButton
            app.ExportAvgMultiDataSheetButton = uibutton(app.MultiDataSheetProcessingTab, 'push');
            app.ExportAvgMultiDataSheetButton.ButtonPushedFcn = createCallbackFcn(app, @AvgMultiDataSheetButtonPushed, true);
            app.ExportAvgMultiDataSheetButton.Position = [568 12 116 36];
            app.ExportAvgMultiDataSheetButton.Text = {'Export Averaged'; 'Multi-Data'};

            % Create ExportMultiDataSheetButton
            app.ExportMultiDataSheetButton = uibutton(app.MultiDataSheetProcessingTab, 'push');
            app.ExportMultiDataSheetButton.ButtonPushedFcn = createCallbackFcn(app, @PlotMultiDataSheetButtonPushed, true);
            app.ExportMultiDataSheetButton.Position = [691 12 100 36];
            app.ExportMultiDataSheetButton.Text = 'Export Multi-Data';

            % Show the figure after all components are created
            app.SAXSReductionUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = SAXSReduction

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.SAXSReductionUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.SAXSReductionUIFigure)
        end
    end
end