function MessageControl(app,event,Message,Mode)

CurrentTime = clock;
Hour = CurrentTime(4);
Min = CurrentTime(5);
Sec = round(CurrentTime(6));
Message  = [sprintf('%02d:%02d:%02d\t',Hour,Min,Sec) Message];
switch Mode
    case 'add' % add
        AddMessage(app,Message);
    case 'replace' % replace
        ReplaceMessage(app,Message);
end
app.MessageTextArea.Value = app.MessageStorage;
drawnow

function AddMessage(app,Message)
MessageTemp = {Message};
app.MessageStorage = [MessageTemp;app.MessageStorage];


function ReplaceMessage(app,Message)
app.MessageStorage{1} = Message;
    