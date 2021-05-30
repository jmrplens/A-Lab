function TwoMicCheckForCalculate(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% This function check the measures to enable calculate button
if ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic1) && ...
        ~isempty(app.ExtVar.ImpedanceTubeTwoMic.Mic2)
    app.ExtUI.StartmeasureButton.Enable = 'on';
else
    app.ExtUI.StartmeasureButton.Enable = 'off';
end
