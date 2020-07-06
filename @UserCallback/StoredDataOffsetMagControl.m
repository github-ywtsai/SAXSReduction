function StoredDataOffsetMagControl(app,event)
ID = app.TargetStoredDataDropDown.Value;

if isempty(event)
    OPCase = 'Update';
elseif event.Source == app.TargetStoredDataDropDown
    OPCase = 'Update';
elseif event.Source == app.DataStorageUITable
    OPCase = 'Update';
else
    OPCase = 'OffsetMagChange';
end

switch OPCase
    case 'Update'
        % dropdown control
        if ID == 0
            app.StoredDataOffsetEditField.Value = 0;
            app.StoredDataMagnificationEditField.Value = 1;
            app.StoredDataOffsetEditField.Enable = 'Off';
            app.StoredDataMagnificationEditField.Enable = 'Off';
        else
            app.StoredDataOffsetEditField.Value = app.DataStorage{ID}.Offset;
            app.StoredDataMagnificationEditField.Value = app.DataStorage{ID}.Magnification;
            app.StoredDataOffsetEditField.Enable = 'On';
            app.StoredDataMagnificationEditField.Enable = 'On';
        end
    case 'OffsetMagChange'
        app.DataStorage{ID}.Offset = app.StoredDataOffsetEditField.Value;
        app.DataStorage{ID}.Magnification = app.StoredDataMagnificationEditField.Value;
        GeneralFunc.PlotStoredProfile(app,event);
end