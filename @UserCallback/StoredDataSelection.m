function StoredDataSelection(app,event)

ID = str2double(app.StoredDataIDDropDown.Value);

if isempty(app.DataStorage{ID})
    return
end

app.StoredDataOffsetEditField.Value = app.DataStorage{ID}.Offset;
app.StoredDataMagnificationEditField.Value = app.DataStorage{ID}.Magnification;