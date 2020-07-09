function EffectiveMaskSelection(app,event)
GeneralFunc.BusyControl(app,event,true)

GeneralFunc.UpdateEffectiveMask(app, event);

GeneralFunc.SingleDataProcess(app,event);
GeneralFunc.PlotCurrentImage(app,event);
GeneralFunc.PlotCurrentProfile(app,event);

GeneralFunc.BusyControl(app,event,false)