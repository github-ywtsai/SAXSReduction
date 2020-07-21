function LoadI0Normalizataion(app,event)

MasterFN = app.MasterInfo.Default.MasterFN;
MasterFF = app.MasterInfo.Default.MasterFF;
DataSheetNum = app.MasterInfo.Default.DataSheetNum;

% generate I0 data file path
I0FN = strrep(MasterFN,'_master.h5','002.txt');
I0FP = fullfile(MasterFF,I0FN);

% check I0 file existing
if ~isfile(I0FP)
    I0List = ones(DataSheetNum,1);
else
    FID = fopen(I0FP,'r');
    TEMP = fscanf(FID,'%f');
    I0List = TEMP(DataSheetNum+1:DataSheetNum+DataSheetNum);
    fclose(FID);
end
I0List = I0List/I0List(1);
app.MasterInfo.I0List = I0List; 

