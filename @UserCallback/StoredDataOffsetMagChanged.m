function StoredDataOffsetMagChanged(app,event)

ID = str2double(app.StoredDataIDDropDown.Value);
if isempty(app.DataStorage{ID}.Offset)
    return
end

app.DataStorage{ID}.Offset = app.StoredDataOffsetEditField.Value;
app.DataStorage{ID}.Magnification = app.StoredDataMagnificationEditField.Value;