function [freqMin,freqMax] = TwoMicCalculateTubeLimits(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

d  = app.ExtVar.ImpedanceTubeTwoMic.d;
s  = app.ExtVar.ImpedanceTubeTwoMic.s;
freqMin =  0.05 * app.c/s;
switch lower(app.ExtVar.ImpedanceTubeTwoMic.Shape)
    case 'circular'
        freqMax = 0.58 * app.c / d;
    case 'square'
        freqMax = 0.5 * app.c / d;
end