function UpdateCSVMaskTable(app,event)

Name = cell(10,1);
Active = cell(10,1);
Inverse = cell(10,1);

for MaskID =  1:10
    if isempty(app.CurrentData.MaskInfo.MaskPool{MaskID})
        Name{MaskID} = [];
        Active{MaskID} = false;
        Inverse{MaskID} = false;
    else
        Name{MaskID} = app.CurrentData.MaskInfo.MaskPool{MaskID}.CSVFN;
        Active{MaskID} = app.CurrentData.MaskInfo.MaskPool{MaskID}.Active;
        Inverse{MaskID} = app.CurrentData.MaskInfo.MaskPool{MaskID}.Inverse;
    end
end

app.CSVMaskUITable.Data = [Name,Active,Inverse];