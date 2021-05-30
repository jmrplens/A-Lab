function [freqMin,freqMax] = FourMicCalculateTubeLimits(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

t  = app.ExtVar.ImpedanceTubeFourMic.t;
s1  = app.ExtVar.ImpedanceTubeFourMic.s1;
s2  = app.ExtVar.ImpedanceTubeFourMic.s2;

% Frequency limits (ASTM 2611-19, equation (1,2))
freqMin =  0.01 * app.c/min(s1,s2);
switch lower(app.ExtVar.ImpedanceTubeFourMic.Shape)
    case 'circular'
        freqMax = 0.586 * app.c / t;
    case 'square'
        freqMax = 0.5 * app.c / t;
end