function FourMicCheckForCalculate(app)
% This function check the measures to enable calculate button
%
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

if app.ExtVar.ImpedanceTubeFourMic.Symmetrical
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1a) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2a) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3a) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4a)
        app.ExtUI.StartmeasureButton.Enable = 'on';
    else
        app.ExtUI.StartmeasureButton.Enable = 'off';
    end
else
    if ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1a) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2a) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3a) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4a) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic1b) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic2b) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic3b) && ...
            ~isempty(app.ExtVar.ImpedanceTubeFourMic.Mic4b)
        app.ExtUI.StartmeasureButton.Enable = 'on';
    else
        app.ExtUI.StartmeasureButton.Enable = 'off';
    end
end