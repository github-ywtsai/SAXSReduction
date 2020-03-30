function KeepedDataSelection(app,event)

ID = str2double(app.KeepedDataIDDropDown.Value);

if isempty(app.KeepedData{ID})
    return
end

app.KeeoedDataOffsetEditField.Value = app.KeepedData{ID}.Offset;
app.MagnificationEditField.Value = app.KeepedData{ID}.Magnification;