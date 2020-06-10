function EffectiveMaskSelection(app,event)
GeneralFunc.BusyControl(app,event,true)

GeneralFunc.UpdateEffectiveMask(app, event);

GeneralFunc.BusyControl(app,event,false)