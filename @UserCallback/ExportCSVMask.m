function ExportCSVMask(app, event)

if isempty(app.MaskGen.MaskPreview)
    return
end

[FN,FF] = uiputfile('*.csv');
if FN == 0
    return
end
FP = fullfile(FF,FN);

[RowIdx,ColIdx] = ndgrid(1:size(app.MaskGen.MaskPreview,1),1:size(app.MaskGen.MaskPreview,2));

SkipIdx = find(~app.MaskGen.MaskPreview);
Y = RowIdx(:)-1; % -1, in order to match the data format from imageJ that X/Y satart from 0.
X = ColIdx(:)-1; % -1, in order to match the data format from imageJ that X/Y satart from 0.
Y(SkipIdx) = [];
X(SkipIdx) = [];
Value = ones(size(X));

DataArray = array2table([X,Y,Value]);
DataArray.Properties.VariableNames(1:3) = {'X','Y','Value'};
writetable(DataArray,FP)
