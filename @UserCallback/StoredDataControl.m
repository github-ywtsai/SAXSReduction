function StoredDataControl(app,event)

if     event.Source == app.ExportSelectedStoredDataButton
    OPMode = 'Export';
    GeneralFunc.StoredProfileOperation(app,OPMode);
elseif event.Source == app.PlotSelectedStoredDataButton
    OPMode = 'Plot';
    GeneralFunc.StoredProfileOperation(app,OPMode);
elseif event.Source == app.DeleteSelectedStoredDataButton
    OPMode = 'Delete';
    SelectedIdx = find(cell2mat(app.DataStorageUITable.Data(:,1)))';
    for SN = SelectedIdx
        app.DataStorage{SN} = [];
    end
    GeneralFunc.UpdateDataStorageTable(app,[]); % including update target stored data dropdown
elseif event.Source == app.SelectUnselectAllButton
    OPMode = 'SelectAll';
    DataStorageNum = app.AdditionalInfo.DataStorageNum;
    EmptyList = false(DataStorageNum,1);

    for KID = 1:DataStorageNum
        EmptyList(KID) = isempty(app.DataStorage{KID});
    end
    
    SelectedList = cell2mat(app.DataStorageUITable.Data(:,1));
    SelectedList(EmptyList) =[];
    if all(SelectedList) % all true will return 1
        % unselect all
        app.DataStorageUITable.Data(:,1) = num2cell(false(DataStorageNum,1));
    else
        app.DataStorageUITable.Data(~EmptyList,1) = deal({true});
    end
end