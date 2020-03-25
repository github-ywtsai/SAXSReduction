function UpdateCSVMaskTable(app,event)

Name = cell(10,1);
Active = cell(10,1);
Inverse = cell(10,1);

for MaskID =  1:10
    if isempty(app.MaskInfo.MaskPool{MaskID})
        Name{MaskID} = [];
        Active{MaskID} = false;
        Inverse{MaskID} = false;
    else
        Name{MaskID} = app.MaskInfo.MaskPool{MaskID}.CSVFN;
        Active{MaskID} = app.MaskInfo.MaskPool{MaskID}.Active;
        Inverse{MaskID} = app.MaskInfo.MaskPool{MaskID}.Inverse;
    end
end

app.CSVMaskUITable.Data = [Name,Active,Inverse];