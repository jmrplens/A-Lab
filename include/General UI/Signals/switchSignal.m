function switchSignal(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

delete(app.ExtUI.SignalSelectedPanel.Children)

app.TypeSignal = app.ExtUI.SignaltypeDropDown.Value;

switch lower(app.TypeSignal)
    
    case 'sweep'
        createPanelSweep(app);
    case 'mls'
        createPanelMLS(app)
    case 'white noise'
        createPanelWhiteNoise(app)
    case 'pink noise'
        createPanelPinkNoise(app)
    case 'pure tone'
        createPanelTone(app)
    case 'custom signal'
        createPanelCustomSignal(app)
end
