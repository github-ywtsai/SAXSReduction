function UpdateEffectiveMaskTable(app,event)

EffectiveMaskPoolNum = numel(app.MaskInfo.EffectiveMaskPool);
Name = cell(EffectiveMaskPoolNum+1,1);

for EffectiveMaskID =  1:EffectiveMaskPoolNum
    Name{EffectiveMaskID} = app.MaskInfo.EffectiveMaskPool{EffectiveMaskID}.MaskName;
end
 Name{EffectiveMaskPoolNum+1} = '';

ColumnFormat = {{'Cancel','Remove'}};

app.EffectiveMaskListUITable.Data = Name;
app.EffectiveMaskListUITable.ColumnFormat = ColumnFormat;
app.EffectiveMaskListUITable.RowName = 'numbered';
