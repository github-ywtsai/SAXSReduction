function KeepedDataOffsetMagChanged(app,event)

ID = str2double(app.KeepedDataIDDropDown.Value);
if isempty(app.KeepedData{ID}.Offset)
    return
end

app.KeepedData{ID}.Offset = app.KeeoedDataOffsetEditField.Value;
app.KeepedData{ID}.Magnification = app.MagnificationEditField.Value;